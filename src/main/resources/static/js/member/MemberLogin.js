@charset "UTF-8";

    .login3 {
		margin-top:40px;
	    height: 100vh;
	    position: relative;}
    .login_box {
        width: 900px;
        height: 600px;
        position: absolute;
        top: 40%;
        left: 50%;
        transform: translate(-50%,-50%);/*Horizontal alignment*/
        background: #fff;
        border-radius: 5px;
        
        box-shadow: 1px 4px 22px -8px rgb(147, 146, 146);
        display: flex;
        overflow: hidden;}
        
    .login_box .left_img{width: 600px; height: 900px;}
    .login_box .right_login{width: 65%; height: 100%; padding: 25px 25px;}

    .right_login .sign-in{
        display: flex;
        align-items: center;
        justify-content: center;
        align-self: center;
        height: 100%;
        width: 80%;
        flex-direction: column;
        margin: auto;
    }
     .right_login input {
        width: 90%;
        outline: none;
        font-size: 15px;
        font-weight: 500;
        align-items: center;
        margin: 15px 0px;
        padding: 10px;
        padding-left: 20px;
        border: 1px solid lightgray;
        border-radius: 20px;
    }

    .right{background: linear-gradient(-45deg, #dcd7e0, #fff);}

    .submit {
        margin: auto;
        margin-top: 30px;
        margin-bottom: 40px;
        padding: 15px 120px;
        width: 100%;
        border: none;
        border-radius: 20px;
        display: block;
        font-weight: 600;
        font-size: 17px;
        color: #fff;
        background: darkred;
        -webkit-box-shadow: 0px 9px 15px -11px rgb(114, 54, 54);
        -moz-box-shadow: 0px 9px 15px -11px rgb(114, 54, 54);
        box-shadow: 0px 9px 15px -11px rgb(114, 54, 54);
    }
    .left_img {
        background: linear-gradient(212.38deg, /*각도*/
        rgba(121, 13, 13, 0.7) 0%,
        rgba(8, 7, 8, 0.71) 50%);
        background-color: black;
        color: #fff;
        position: relative;
        background-size: width 600px height 500px;
    }
    section {display: flex; overflow: hidden;}
    #mainimg{
    	width: 430px; 
        height: 600px;
    }
    #humanimg{
 
        width: 300px; 
        height: 120px;
    }
    
