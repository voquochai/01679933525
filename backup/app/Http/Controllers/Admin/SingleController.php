<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Facades\Image;
use App\Single;
use App\SingleLanguage;

use DateTime;

class SingleController extends Controller
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
        $this->_data['siteconfig'] = config('siteconfig.single');
        $this->_data['default_language'] = config('siteconfig.general.language');
        $this->_data['languages'] = config('siteconfig.languages');
        $this->_data['path'] = $this->_data['siteconfig']['path'];
        $this->_data['thumbs'] = $this->_data['siteconfig'][$this->_data['type']]['thumbs'];
        $this->_data['pageTitle'] = $this->_data['siteconfig'][$this->_data['type']]['page-title'];
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function index(){
        $single = Single::where('type', $this->_data['type'])->first();
        if ($single === null) {
            $single  = new Single;
            $single->type           = $this->_data['type'];
            $single->created_at     = new DateTime();
            $single->updated_at     = new DateTime();
            $single->save();

            $dataL = [];
            $dataInsert = [];
            foreach($this->_data['languages'] as $lang => $val){
                $dataL['title'] = $this->_data['siteconfig'][$this->_data['type']]['page-title'];
                $dataL['slug'] = str_slug($this->_data['siteconfig'][$this->_data['type']]['page-title']);
                $dataL['meta_seo']['title'] = null;
                $dataL['meta_seo']['keywords'] = null;
                $dataL['meta_seo']['description'] = null;
                $dataL['language']   = $lang;
                $dataInsert[]        = new SingleLanguage($dataL);
            }
            $single->languages()->saveMany($dataInsert);
        }
        return redirect()->route('single.edit',['id' => $single->id, 'type' => $this->_data['type']]);
    }
    
    public function create(){
        return view('admin.single.create',$this->_data);
    }

    public function store(Request $request){
        // dd($request);
        $valid = Validator::make($request->all(), [
            'dataL.vi.title'   => 'required',
            'image'            => 'image|max:2048'
        ], [
            'dataL.vi.title.required'   => 'Vui lòng nhập Tên Bài Viết',
            'image.image'               => 'Không đúng chuẩn hình ảnh cho phép',
            'image.max'                 => 'Dung lượng vượt quá giới hạn cho phép là :max KB'
        ]);
        if ($valid->fails()) {
            return redirect()->back()->withErrors($valid)->withInput();
        } else {
            $single  = new Single;

            if($request->data){
                foreach($request->data as $field => $value){
                    $single->$field = $value;
                }
            }

            if($request->hasFile('image')){
                $single->image = save_image( $this->_data['path'],$request->file('image'),$this->_data['thumbs'] );
            }
            
            $single->priority       = (int)str_replace('.', '', $request->priority);
            $single->status         = ($request->status) ? implode(',',$request->status) : '';
            $single->type           = $this->_data['type'];
            $single->created_at     = new DateTime();
            $single->updated_at     = new DateTime();
            $single->save();

            $dataL = [];
            $dataInsert = [];
            foreach($this->_data['languages'] as $lang => $val){
                if($request->dataL[$lang]){
                    foreach($request->dataL[$lang] as $fieldL => $valueL){
                        $dataL[$fieldL] = $valueL;
                    }
                }

                if( !isset($request->dataL[$this->_data['default_language']]['slug']) || $request->dataL[$this->_data['default_language']]['slug'] == ''){
                    $dataL['slug']       = str_slug($request->dataL[$this->_data['default_language']]['title']);
                }else{
                    $dataL['slug']       = str_slug($request->dataL[$this->_data['default_language']]['slug']);
                }
                $dataL['language']   = $lang;
                $dataInsert[]        = new SingleLanguage($dataL);
            }
            $single->languages()->saveMany($dataInsert);

            return redirect()->route('single.index',['type'=>$this->_data['type']])->with('success','Thêm dữ liệu <b>'.$single->languages[0]->title.'</b> thành công');
        }
        
    }

    public function edit($id){
        $this->_data['item'] = Single::find($id);
        if ($this->_data['item'] !== null) {
            return view('admin.single.edit',$this->_data);
        }
        return redirect()->route('single.index',['type'=>$this->_data['type']])->with('danger', 'Dữ liệu không tồn tại');
    }

    public function update(Request $request, $id){
        // dd($request);
        $valid = Validator::make($request->all(), [
            'dataL.vi.title' => 'required',
            'image' => 'image|max:2048'
        ], [
            'dataL.vi.title.required'    => 'Vui lòng nhập Tên Bài Viết',
            'image.image' => 'Không đúng chuẩn hình ảnh cho phép',
            'image.max' => 'Dung lượng vượt quá giới hạn cho phép là :max KB'
        ]);
        if ($valid->fails()) {
            return redirect()->back()->withErrors($valid)->withInput();
        } else {
            $single = Single::find($id);
            if ($single !== null) {
                if($request->data){
                    foreach($request->data as $field => $value){
                        $single->$field = $value;
                    }
                }

                if($request->hasFile('image')){
                    delete_image( $this->_data['path'].'/'.$single->image, $this->_data['thumbs'] );
                    $single->image = save_image( $this->_data['path'], $request->file('image'), $this->_data['thumbs'] );
                }

                $single->priority       = (int)str_replace('.', '', $request->priority);
                $single->status         = ($request->status) ? implode(',',$request->status) : '';
                $single->type           = $this->_data['type'];
                $single->updated_at     = new DateTime();
                $single->save();
                $i = 0;
                foreach($this->_data['languages'] as $lang => $val){
                    $singleLang = SingleLanguage::find($single->languages[$i]['id']);
                    if($request->dataL[$lang]){
                        foreach($request->dataL[$lang] as $fieldL => $valueL){
                            $singleLang->$fieldL = $valueL;
                        }
                    }
                    if( !isset($request->dataL[$this->_data['default_language']]['slug']) || $request->dataL[$this->_data['default_language']]['slug'] == '' ){
                        $singleLang->slug       = str_slug($request->dataL[$this->_data['default_language']]['title']);
                    }else{
                        $singleLang->slug       = str_slug($request->dataL[$this->_data['default_language']]['slug']);
                    }
                    $singleLang->language   = $lang;
                    $singleLang->save();
                    $i++;
                }
                return redirect( $request->redirects_to )->with('success','Cập nhật dữ liệu <b>'.$single->languages[0]->title.'</b> thành công');
            }
            return redirect( $request->redirects_to )->with('danger', 'Dữ liệu không tồn tại');
        }
    }

    public function delete($id){
        $single = Single::find($id);
        $deleted = $single->languages[0]->title;
        if ($single !== null) {
            delete_image($this->_data['path'].'/'.$single->image,$this->_data['thumbs']);
            if( $single->delete() ){
                return redirect()->route('single.index',['type'=>$this->_data['type']])->with('success', 'Xóa dữ liệu <b>'.$deleted.'</b> thành công');
            }else{
                return redirect()->route('single.index',['type'=>$this->_data['type']])->with('danger', 'Xóa dữ liệu bị lỗi');
            }
        }
        return redirect()->route('single.index',['type'=>$this->_data['type']])->with('danger', 'Dữ liệu không tồn tại');
    }

}
