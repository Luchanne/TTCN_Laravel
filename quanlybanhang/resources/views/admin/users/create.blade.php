@extends('admin.layouts.app')
@section('title','Create User')
@section('content')
        <div class="card">
            <h1>Create User</h1>
            <div>
                <form action="{{ route('users.store') }}" method="post" enctype="multipart/form-data">
                    @csrf

                    <div class="row">
                    <div class=" input-group-static col-5 mb-4">
                        <label>Image</label>
                        <input type="file" accept="image/png,image/jpeg,image/jpg" name="image" id="image-input" class="form-control">

                        @error('image')
                            <span class="text-danger"> {{ $message }}</span>
                        @enderror
                    </div>
                    <div class="col-5">
                        <img src="" width="200" height="200" id="show-image" alt="">
                    </div>
                </div>

                    <div class="input-group input-group-static mb-4">
                        <label>Name</label>
                        <input type="text" name="name" value="{{ old('name') }}" class="form-control">

                        @error('name')
                            <span class="text-danger">{{ $message }}</span>
                        @enderror
                    </div>
                    
                    <div class="input-group input-group-static mb-4">
                        <label>Email</label>
                        <input type="text" value="{{ old('email') }}" name="email" class="form-control">

                        @error('email')
                            <span class="text-danger">{{ $message }}</span>
                        @enderror
                    </div>


                    <div class="input-group input-group-static mb-4">
                        <label>Phone</label>
                        <input type="text" value="{{ old('phone') }}" name="phone" class="form-control">

                        @error('phone')
                            <span class="text-danger">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="input-group input-group-static mb-4">
                        <label>Address</label>
                        <textarea value="{{ old('address') }}" name="address" class="form-control"></textarea>

                        @error('address')
                            <span class="text-danger">{{ $message }}</span>
                        @enderror
                    </div>



                    <div class="input-group input-group-static mb-4">
                        <label name="group" class="ms-0">Gender</label>
                            <select name="gender" class="form-control">
                                <option value="male">Male</option>
                                <option value="fe-male">FeMale</option>
                            </select>
                        @error('gender')
                            <span class="text-danger"> {{ $message }}</span>
                        @enderror
                    </div>


                    <div class="input-group input-group-static mb-4">
                        <label>Password</label>
                         <input type="password" name="password" class="form-control">
                            @error('password')
                                <span class="text-danger"> {{ $message }}</span>
                             @enderror
                    </div>


                    <div class="form-group">
                            <label for="">Roles</label>
                        <div class="row">
                        @foreach ($roles as $groupName => $role)
                                <div class="col-5">
                                    <h4>{{ $groupName }}</h4>

                                    <div>
                                        @foreach ($role as $item)
                                        <div class="form-check">
                                            <input class="form-check-input" name="role_ids[]" type="checkbox"
                                                value="{{ $item->id }}">
                                            <label class="custom-control-label"
                                                for="customCheck1">{{ $item->display_name }}</label>
                                        </div>
                                    @endforeach
                                    </div>
                                </div>
                        @endforeach
                        </div>
                    </div>

                    <button type="submit" class="btn btn-submit btn-primary">Submit</button>
                </form>
            </div>
        </div>
    @include('admin.users.scripts')
@endsection


