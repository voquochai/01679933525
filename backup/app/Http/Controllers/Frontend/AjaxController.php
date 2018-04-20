<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;
use DateTime;
class AjaxController extends Controller
{

	public function index(Request $request){

        switch($request->act){
            case 'newsletter':
                $data = $this->newsletter($request);
                break;
            case 'contact':
                $data = $this->contact($request);
                break;
            case 'comment':
                $data = $this->comment($request);
                break;
        }
        return response()->json($data);
    }
    
    public function newsletter($request){
        $valid = Validator::make($request->all(), [
            'email' => [
                'required',
                'email',
                Rule::unique('registers')->where(function ($query) use($request) {
                    $query->where('email', $request->email)->where('type', $request->type);
                })
            ],
        ], [
            'email.required' => 'Vui lòng nhập Email',
            'email.email' => 'Không đúng định dạng Email',
            'email.unique' => 'Email này đã đăng ký, vui lòng chọn Email khác',
        ]);

        $data['type'] = 'danger';
        $data['icon'] = 'warning';

        if ($valid->fails()) {
            $data['message'] = $valid->errors()->first();
            return $data;
        } else {
            $data_insert['title'] = "Đăng ký nhận bản tin";
            $data_insert['email'] = $request->email;
            $data_insert['type'] = $request->type;
            $data_insert['created_at'] = new DateTime();
            $data_insert['updated_at'] = new DateTime();

            if(DB::table('registers')->insert($data_insert)){
                $data['type'] = 'success';
                $data['icon'] = 'check';
                $data['message'] = "Đăng ký thành công";
            }else{
                $data['message'] = "Đăng ký thất bại";
            }
        }
    	return $data;
    }

    public function contact($request){
        $valid = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'subject' => 'required',
            'message' => 'required',
            // 'score' => 'required|between:1,5'
        ], [
            'name.required' => 'Yêu cầu nhập tên',
            'email.required' => 'Yêu cầu nhập Email',
            'email.email' => 'Không đúng định dạng Email',
            'subject.required' => 'Yêu cầu nhập chủ đề',
            'message.required' => 'Yêu cầu nhập lời nhắn',
            // 'score.required' => 'Yêu cầu nhập vào điểm số',
            // 'score.between' => 'Vui lòng chỉ nhập từ :min tới :max khi chấm điểm'
        ]);

        $data['type'] = 'danger';
        $data['icon'] = 'warning';

        if ($valid->fails()) {
            $data['message'] = $valid->errors()->first();
            return $data;
        } else {
            $data_insert['title'] = $request->subject;
            $data_insert['name'] = $request->name;
            $data_insert['email'] = $request->email;
            $data_insert['description'] = $request->message;
            $data_insert['email'] = $request->email;
            $data_insert['type'] = $request->type;
            $data_insert['created_at'] = new DateTime();
            $data_insert['updated_at'] = new DateTime();

            if(DB::table('registers')->insert($data_insert)){
                $data['type'] = 'success';
                $data['icon'] = 'check';
                $data['message'] = "Gửi thư liên hệ thành công";
            }else{
                $data['message'] = "Gửi thư liên hệ thất bại";
            }
        }
        return $data;
    }

    public function comment($request){
        $valid = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'contents' => 'required',
            // 'score' => 'required|between:1,5'
        ], [
            'name.required' => 'Yêu cầu nhập tên',
            'email.required' => 'Yêu cầu nhập Email',
            'email.email' => 'Không đúng định dạng Email',
            'contents.required' => 'Yêu cầu nhập nội dung',
            // 'score.required' => 'Yêu cầu nhập vào điểm số',
            // 'score.between' => 'Vui lòng chỉ nhập từ :min tới :max khi chấm điểm'
        ]);

        $data['type'] = 'danger';
        $data['icon'] = 'warning';

        if ($valid->fails()) {
            $data['message'] = $valid->errors()->first();
            return $data;
        } else {
            $data_insert['product_id'] = ($request->product_id) ? $request->product_id : null ;
            $data_insert['post_id'] = ($request->post_id) ? $request->post_id : null ;
            $data_insert['user_id'] = auth()->check() ? auth()->id() : null ;
            $data_insert['name'] = $request->name;
            $data_insert['email'] = $request->email;
            $data_insert['description'] = $request->contents;
            $data_insert['type'] = $request->type;
            $data_insert['created_at'] = new DateTime();
            $data_insert['updated_at'] = new DateTime();

            if(DB::table('comments')->insert($data_insert)){
                $data['type'] = 'success';
                $data['icon'] = 'check';
                $data['message'] = "Góp ý thành công";
            }else{
                $data['message'] = "Góp ý thất bại";
            }
        }
        return $data;
    }
}
