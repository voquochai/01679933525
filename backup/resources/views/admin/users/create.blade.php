@extends('admin.app')
@section('title') Thành viên @endsection
@section('content')
<div class="portlet box green">
    <div class="portlet-title">
        <div class="caption">
            <i class="icon-layers"></i>Thêm mới
        </div>
    </div>

    <div class="portlet-body">
        <form role="form" method="POST" action="{{ route('user.store') }}">
            {{ csrf_field() }}

            <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                <label for="name" class="control-label">Name</label>
                <div>
                    <input id="name" type="text" class="form-control" name="name" value="{{ old('name') }}">

                    @if ($errors->has('name'))
                        <span class="help-block">
                            <strong>{{ $errors->first('name') }}</strong>
                        </span>
                    @endif
                </div>
            </div>

            <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                <label for="email" class="control-label">E-Mail Address</label>
                <div>
                    <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}">

                    @if ($errors->has('email'))
                        <span class="help-block">
                            <strong>{{ $errors->first('email') }}</strong>
                        </span>
                    @endif
                </div>
            </div>

            <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                <label for="password" class="control-label">Password</label>
                <div>
                    <input id="password" type="password" class="form-control" name="password">

                    @if ($errors->has('password'))
                        <span class="help-block">
                            <strong>{{ $errors->first('password') }}</strong>
                        </span>
                    @endif
                </div>
            </div>

            <div class="form-group">
                <label for="password-confirm" class="control-label">Confirm Password</label>
                <div>
                    <input id="password-confirm" type="password" class="form-control" name="password_confirmation">
                </div>
            </div>

            <div class="form-group">
                <div>
                    <button type="submit" class="btn green"> <i class="fa fa-check"></i> Lưu </button>
                    <a href="{{ url()->previous() }}" class="btn default" > Thoát </a>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection