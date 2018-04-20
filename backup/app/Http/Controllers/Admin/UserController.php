<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

use App\User;

class UserController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    	$data['items'] = User::paginate(25);
        return view('admin.users.index',$data);
    }

    public function create(){
    	return view('admin.users.create');
    }

    public function store(Request $request){
        $valid = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|confirmed'
        ], [
            'name.required' => 'Vui lòng nhập Họ Tên',
            'email.required' => 'Vui lòng nhập Email',
            'email.email' => 'Không đúng định dạng Email',
            'email.unique' => 'Email này đã trùng, vui lòng chọn Email khác',
            'password.required' => 'Vui lòng nhập Mật Khẩu',
        ]);
        if ($valid->fails()) {
            return redirect()->back()->withErrors($valid)->withInput();
        } else {
            $user = User::create([
                'name' => $request->input('name'),
                'email' => $request->input('email'),
                'password' => bcrypt($request->input('password')),
                'remember_token' => str_random(10),
            ]);
            return redirect()->route('user.index')->with('success', "Thêm người dùng $user->name thành công");
        }
    }

    public function edit($id){
        $data['item'] = User::find($id);
        if ($data['item'] !== null) {
            return view('admin.users.edit',$data);
        }
        return redirect()->route('user.index')->with('danger', 'Không tìm thấy người dùng này');
    }

    public function update(Request $request, $id){
    	$valid = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email|unique:users,email,' . $id,
            'password' => 'confirmed'
        ], [
            'name.required' => 'Vui lòng nhập Họ Tên',
            'email.required' => 'Vui lòng nhập Email',
            'email.email' => 'Không đúng định dạng Email',
            'email.unique' => 'Email này đã trùng, vui lòng chọn Email khác'
        ]);

        if ($valid->fails()) {
            return redirect()->back()->withErrors($valid)->withInput();
        } else {
            $user = User::find($id);
            if ($user !== null) {
                $user->name = $request->input('name');
                $user->email = $request->input('email');
                if ($request->input('password')) {
                    $user->password = bcrypt($request->input('password'));
                }
                $user->save();
                return redirect()->route('user.index')->with('success', "Cập nhật người dùng $user->name thành công");
            }
            return redirect()->route('user.index')->with('danger', 'Không tìm thấy người dùng này');
        }
    }

    public function delete($id){
    	$user = User::find($id);

        \App\Product::whereIn('id',$user->products()->pluck('id')->toArray())->update(['user_id' => 1]);
        \App\Post::whereIn('id',$user->posts()->pluck('id')->toArray())->update(['user_id' => 1]);
        
        if ($user !== null) {
            $user->delete();
            return redirect()->route('user.index')->with('success', "Xóa người dùng $user->name thành công");
        }
        return redirect()->route('user.index')->with('danger', 'Không tìm thấy người dùng này');
    }

}
