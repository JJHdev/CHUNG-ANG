<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=yes, initial-scale=1, maximum_scale=1, minimum_scale=1.0 ,width=device-width, target_densitydpi=device-dpi">

    <title><spring:message code="title.sysname"/></title>

<style>
    html, body {overflow:hidden;}
    body {background:url(/images/bg.jpg) top left no-repeat; margin:0 auto;}
    
    header {
        width: 100%;
        height: 60px;
        background: #0079C4;
        position: fixed;
        left: 0;
        top: 0;
        z-index: 1000;
        min-width: 1680px;
    }
    
    section {
        text-align:center; 
    }
    
    div.error-msg {max-width:640px; width:100%; height:370; margin:160px auto;}
    div.error-msg p {font-size:26px; color:#000;}
    div.error-msg {outline:20px solid #e4f0fd; border:1px solid #000; background:#fff;}
    div img {padding:40px 0;}
    a.back-btn-a {font-size:20px; color:#fff; background:#2473c2; padding:10px 40px; border-radius:5px; box-shadow:2px 2px 5px rgba(0,0,0,.5)}
    a:hover.back-btn-a {background:#1c5997; box-shadow:2px 2px 5px rgba(0,0,0,.5) inset}
    
    header a {
        position: relative;
        top: 10px;
        left: 20px;
    }
</style>