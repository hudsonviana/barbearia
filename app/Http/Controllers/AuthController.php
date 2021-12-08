<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use App\Models\User;

class AuthController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login', 'register']]);
    }

    // Login
    public function login()
    {
        $credentials = request(['username', 'password']);

        if (! $token = auth()->attempt($credentials)) {
            return response()->json(['error' => 'Acesso Não Autorizado'], 401);
        }

        return $this->respondWithToken($token);
    }

    // Cadastro
    public function register(Request $request) {
        $user = User::where('email', $request->email)->first();

        if (!$user) {
            $user = new User();
            $user->email = $request->email;
            $user->username = $request->username;
            $user->fullname = $request->fullname;
            $user->image = 'https://png.pngtree.com/png-clipart/20190924/original/pngtree-user-vector-avatar-png-image_4830521.jpg';
            $user->password = bcrypt($request->password);
            $user->activated = 1;
            $user->save();

            return response()->json(['message' => 'Usuário criado com sucesso!', 'user' => $user]);
        } else {
            return response()->json(['error' => 'Este email já está cadastrado.'], 401);
        }
    }

    // Me
    public function me()
    {
        return response()->json(auth()->user());
    }

    // Logout
    public function logout()
    {
        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    // Refresh
    public function refresh()
    {
        return $this->respondWithToken(auth()->refresh());
    }

    //
    protected function respondWithToken($token)
    {
        return response()->json([
            'user' => auth()->user(),
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60
        ]);
    }

}
