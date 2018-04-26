<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use App\Comment;

use DateTime;

class CommentController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    private $_data;

    public function __construct(Request $request)
    {
        $this->_data['type'] = (isset($request->type) && $request->type !='') ? $request->type : 'default';
        $this->_data['siteconfig'] = config('siteconfig.comment');
        $this->_data['default_language'] = config('siteconfig.general.language');
        $this->_data['languages'] = config('siteconfig.languages');
        $this->_data['pageTitle'] = $this->_data['siteconfig'][$this->_data['type']]['page-title'];
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function index(){
        $comments = DB::table('comments as A')
            ->leftjoin('product_languages as B', 'A.product_id','=','B.product_id')
            ->leftjoin('post_languages as C', 'A.post_id','=','C.post_id')
            ->select('A.*', 'B.title as product_name', 'C.title as post_name')
            ->orWhere('B.language', $this->_data['default_language'])
            ->orWhere('C.language', $this->_data['default_language'])
            ->where('A.type',$this->_data['type'])
            ->orderBy('A.priority','asc')
            ->orderBy('A.id','desc')
            ->paginate(25);
        if( count($comments) > 0 ){
            foreach($comments as $value){
                $parent=$value->parent;
                $this->_data['items'][$parent][]=$value;
            }
        }else{
            $this->_data['items'] = [];
        }
        return view('admin.comments.index',$this->_data);
    }
    
    public function create(){
        return view('admin.comments.create',$this->_data);
    }

    public function store(Request $request){
        // dd($request);
        $valid = Validator::make($request->all(), [
            'image'            => 'image|max:2048'
        ], [
            'image.image'               => 'Không đúng chuẩn hình ảnh cho phép',
            'image.max'                 => 'Dung lượng vượt quá giới hạn cho phép là :max KB'
        ]);
        if ($valid->fails()) {
            return redirect()->back()->withErrors($valid)->withInput();
        } else {
            $comment  = new Comment;

            if($request->data){
                foreach($request->data as $field => $value){
                    $comment->$field = $value;
                }
            }
            
            $comment->priority       = (int)str_replace('.', '', $request->priority);
            $comment->status         = ($request->status) ? implode(',',$request->status) : '';
            $comment->type           = $this->_data['type'];
            $comment->created_at     = new DateTime();
            $comment->updated_at     = new DateTime();
            $comment->save();
            return redirect()->route('admin.comment.index',['type'=>$this->_data['type']])->with('success','Thêm dữ liệu <b>'.$comment->name.'</b> thành công');
        }
        
    }

    public function edit($id){
        $this->_data['item'] = Comment::find($id);
        if ($this->_data['item'] !== null) {
            return view('admin.comments.edit',$this->_data);
        }
        return redirect()->route('admin.comment.index',['type'=>$this->_data['type']])->with('danger', 'Dữ liệu không tồn tại');
    }

    public function update(Request $request, $id){
        // dd($request);
        $valid = Validator::make($request->all(), [
            'image' => 'image|max:2048',
        ], [
            'image.image' => 'Không đúng chuẩn hình ảnh cho phép',
            'image.max' => 'Dung lượng vượt quá giới hạn cho phép là :max KB',
        ]);
        if ($valid->fails()) {
            return redirect()->back()->withErrors($valid)->withInput();
        } else {
            $comment = Comment::find($id);
            if ($comment !== null) {
                if($request->data){
                    foreach($request->data as $field => $value){
                        $comment->$field = $value;
                    }
                }

                $comment->priority       = (int)str_replace('.', '', $request->priority);
                $comment->status         = ($request->status) ? implode(',',$request->status) : '';
                $comment->type           = $this->_data['type'];
                $comment->updated_at     = new DateTime();
                $comment->save();

                return redirect( $request->redirects_to )->with('success','Cập nhật dữ liệu <b>'.$comment->name.'</b> thành công');
            }
            return redirect( $request->redirects_to )->with('danger', 'Dữ liệu không tồn tại');
        }
    }

    public function delete($id){
        $comment = Comment::find($id);
        $deleted = $comment->name;
        if ($comment !== null) {
            if( $comment->delete() ){
                return redirect()->route('admin.comment.index',['type'=>$this->_data['type']])->with('success', 'Xóa dữ liệu <b>'.$deleted.'</b> thành công');
            }else{
                return redirect()->route('admin.comment.index',['type'=>$this->_data['type']])->with('danger', 'Xóa dữ liệu bị lỗi');
            }
        }
        return redirect()->route('admin.comment.index',['type'=>$this->_data['type']])->with('danger', 'Dữ liệu không tồn tại');
    }
}
