<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\studentcontroller;

Route::get('/student',[studentcontroller::class,'index']);
