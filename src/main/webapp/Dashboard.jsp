<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<style>
    :root{
        --color-primary: #6C9BCF;
        --color-danger: #FF0060;
        --color-success: #1B9C85;
        --color-warning: #F7D060;
        --color-white: #fff;
        --color-info-dark: #7d8da1;
        --color-dark: #363949;
        --color-light: rgba(132, 139, 200, 0.18);
        --color-dark-variant: #677483;
        --color-background: #f6f6f9;

        --card-border-radius: 2rem;
        --border-radius-1: 0.4rem;
        --border-radius-2: 1.2rem;

        --card-padding: 1.8rem;
        --padding-1: 1.2rem;

        --box-shadow: 0 2rem 3rem var(--color-light);
    }

    .dark-mode-variables{
        --color-background: #181a1e;
        --color-white: #202528;
        --color-dark: #edeffd;
        --color-dark-variant: #a3bdcc;
        --color-light: rgba(0, 0, 0, 0.4);
        --box-shadow: 0 2rem 3rem var(--color-light);
    }

    *{
        margin: 0;
        padding: 0;
        outline: 0;
        /*appearance: 0;*/
        border: 0;
        text-decoration: none;
        box-sizing: border-box;
    }

    html{
        font-size: 14px;
    }

    body{
        width: 100vw;
        height: 100vh;
        font-family: 'Poppins', sans-serif;
        font-size: 0.88rem;
        user-select: none;
        overflow-x: hidden;
        color: var(--color-dark);
        background-color: var(--color-background);
    }

    a{
        color: var(--color-dark);
    }

    img{
        display: block;
        width: 100%;
        object-fit: cover;
    }

    h1{
        font-weight: 800;
        font-size: 1.8rem;
    }

    h2{
        font-weight: 600;
        font-size: 1.4rem;
    }

    h3{
        font-weight: 500;
        font-size: 0.87rem;
    }

    small{
        font-size: 0.76rem;
    }

    p{
        color: var(--color-dark-variant);
    }

    b{
        color: var(--color-dark);
    }

    .text-muted{
        color: var(--color-info-dark);
    }

    .danger{
        color: var(--color-danger);
    }


    .container{
        display: grid;
        width: 96%;
        margin: 0 auto;
        gap: 2rem;
        grid-template-columns: 12rem auto 18rem;
    }

    aside{
        height: 100vh;
    }

    aside .toggle{
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-top: 1.4rem;
    }

    aside .toggle .logo{
        display: flex;
        gap: 0.5rem;
    }

    aside .toggle .logo img{
        width: 2rem;
        height: 2rem;
    }

    aside .toggle .close{
        padding-right: 1rem;
        display: none;
    }

    aside .sidebar{
        display: flex;
        flex-direction: column;
        background-color: var(--color-white);
        box-shadow: var(--box-shadow);
        border-radius: 15px;
        height: 88vh;
        position: relative;
        top: 1.5rem;
        transition: all 0.3s ease;
    }

    aside .sidebar:hover{
        box-shadow: none;
    }

    aside .sidebar a{
        display: flex;
        align-items: center;
        color: var(--color-info-dark);
        height: 3.7rem;
        gap: 1rem;
        position: relative;
        margin-left: 2rem;
        transition: all 0.3s ease;
    }

    aside .sidebar a span{
        font-size: 1.6rem;
        transition: all 0.3s ease;
    }

    aside .sidebar a:last-child{
        position: absolute;
        bottom: 2rem;
        width: 100%;
    }

    aside .sidebar a.active{
        width: 100%;
        color: var(--color-primary);
        background-color: var(--color-light);
        margin-left: 0;
    }

    aside .sidebar a.active::before{
        content: '';
        width: 6px;
        height: 18px;
        background-color: var(--color-primary);
    }

    aside .sidebar a.active span{
        color: var(--color-primary);
        margin-left: calc(1rem - 3px);
    }

    aside .sidebar a:hover{
        color: var(--color-primary);
    }

    aside .sidebar a:hover span{
        margin-left: 0.6rem;
    }


    main{
        margin-top: 1.4rem;
        width: 100%;
    }


    main .analyse > div{
        background-color: var(--color-white);
        padding: var(--card-padding);
        border-radius: var(--card-border-radius);
        margin-top: 1rem;
        box-shadow: var(--box-shadow);
        cursor: pointer;
        transition: all 0.3s ease;
    }

    main .analyse > div:hover{
        box-shadow: none;
    }



    main .new-users{
        margin-top: 1.3rem;
    }

    main .new-users .user-list{
        background-color: var(--color-white);
        padding: var(--card-padding);
        border-radius: var(--card-border-radius);
        margin-top: 1rem;
        box-shadow: var(--box-shadow);
        display: flex;
        flex-direction: column;
        width: 100%;
        transition: all 0.3s ease;
    }

    main .new-users .user-list:hover{
        box-shadow: none;
    }

    main .new-users .user-list .user img{
        width: 5rem;
        height: 5rem;
        margin-bottom: 0.4rem;
        border-radius: 50%;
    }




    main table tbody td{
        height: 2.8rem;
        border-bottom: 1px solid var(--color-light);
        color: var(--color-dark-variant);
    }

    main table tbody tr:last-child td{
        border: none;
    }

    .right-section{
        margin-top: 1.4rem;
    }

    .right-section .nav{
        display: flex;
        justify-content: end;
        gap: 2rem;
    }

    .right-section .nav button{
        display: none;
    }

    .right-section .dark-mode{
        background-color: var(--color-light);
        display: flex;
        justify-content: space-between;
        align-items: center;
        height: 1.6rem;
        width: 4.2rem;
        cursor: pointer;
        border-radius: var(--border-radius-1);
    }

    .right-section .dark-mode span{
        font-size: 1.2rem;
        width: 50%;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .right-section .dark-mode span.active{
        background-color: var(--color-primary);
        color: white;
        border-radius: var(--border-radius-1);
    }

    .right-section .nav .profile{
        display: flex;
        gap: 2rem;
        text-align: right;
    }


    .right-section .user-profile img{
        width: 11rem;
        height: auto;
        margin-bottom: 0.8rem;
        border-radius: 50%;
    }

    .right-section .user-profile h2{
        margin-bottom: 0.2rem;
    }


    @media screen and (max-width: 1200px) {
        .container{
            width: 95%;
            grid-template-columns: 7rem auto 18rem;
        }

        aside .logo h2{
            display: none;
        }

        aside .sidebar h3{
            display: none;
        }

        aside .sidebar a{
            width: 5.6rem;
        }

        aside .sidebar a:last-child{
            position: relative;
            margin-top: 1.8rem;
        }


    }

    @media screen and (max-width: 768px) {
        .container{
            width: 100%;
            grid-template-columns: 1fr;
        }

        aside{
            position: fixed;
            background-color: var(--color-white);
            width: 15rem;
            z-index: 3;
            box-shadow: 1rem 3rem 4rem var(--color-light);
            height: 100vh;
            left: -100%;
            display: none;
            animation: showMenu 0.4s ease forwards;
        }

        @keyframes showMenu {
            to{
                left: 0;
            }
        }

        aside .logo{
            margin-left: 1rem;
        }

        aside .logo h2{
            display: inline;
        }

        aside .sidebar h3{
            display: inline;
        }

        aside .sidebar a{
            width: 100%;
            height: 3.4rem;
        }

        aside .sidebar a:last-child{
            position: absolute;
            bottom: 5rem;
        }

        aside .toggle .close{
            display: inline-block;
            cursor: pointer;
        }

        main{
            margin-top: 8rem;
            padding: 0 1rem;
        }


        .right-section{
            width: 94%;
            margin: 0 auto 4rem;
        }

        .right-section .nav{
            position: fixed;
            top: 0;
            left: 0;
            align-items: center;
            background-color: var(--color-white);
            padding: 0 var(--padding-1);
            height: 4.6rem;
            width: 100%;
            z-index: 2;
            box-shadow: 0 1rem 1rem var(--color-light);
            margin: 0;
        }

        .right-section .nav .dark-mode{
            width: 4.4rem;
            position: absolute;
            left: 66%;
        }

        .right-section .profile .info{
            display: none;
        }

        .right-section .nav button{
            display: inline-block;
            background-color: transparent;
            cursor: pointer;
            color: var(--color-dark);
            position: absolute;
            left: 1rem;
        }

        .right-section .nav button span{
            font-size: 2rem;
        }

        #stepContent {
            padding: 1rem;
            margin: 1rem;
        }

        .progress-steps {
            padding: 0 1rem;
        }
    }

    .cancellation-steps {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
        gap: 1.5rem;
        width: 100%;
        padding: 1rem;
    }

    .step {
        display: flex;
        align-items: center;
        background: var(--color-white);
        padding: 1.5rem;
        border-radius: var(--card-border-radius);
        box-shadow: var(--box-shadow);
        transition: all 300ms ease;
        cursor: pointer;
    }

    .step:hover {
        box-shadow: none;
        transform: translateY(-2px);
    }

    .step-number {
        height: 3rem;
        width: 3rem;
        background: var(--color-primary);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.5rem;
        color: var(--color-white);
        margin-right: 1.5rem;
    }

    .step-content h3 {
        font-size: 1rem;
        margin-bottom: 0.5rem;
    }

    .step-content p {
        font-size: 0.85rem;
        color: var(--color-info-dark);
    }

    @media screen and (max-width: 768px) {
        .cancellation-steps {
            grid-template-columns: 1fr;
        }
    }

    .progress-steps {
        display: flex;
        justify-content: space-between;
        margin-bottom: 2rem;
        padding: 0 2rem;
        max-width: 1200px;
        width: 100%;
        margin-left: auto;
        margin-right: auto;
    }

    .progress-step {
        display: flex;
        align-items: center;
        gap: 0.5rem;
        color: var(--color-info-dark);
        cursor: pointer;
        transition: all 0.3s ease;
        padding: 0.5rem 1rem;
        border-radius: var(--border-radius-1);
    }

    .progress-step:hover {
        background: var(--color-light);
        transform: translateY(-2px);
    }

    .progress-step.active {
        color: var(--color-primary);
    }

    .progress-step span {
        width: 2rem;
        height: 2rem;
        border-radius: 50%;
        background: var(--color-light);
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 500;
        transition: all 0.3s ease;
    }

    .progress-step.active span {
        background: var(--color-primary);
        color: var(--color-white);
    }

    .progress-step p {
        margin: 0;
        font-weight: 500;
    }

    .progress-bar {
        width: 100%;
        height: 0.5rem;
        background: var(--color-light);
        border-radius: var(--border-radius-1);
        margin: 2rem 0;
        position: relative;
        overflow: hidden;
    }

    .progress-bar::before {
        content: '';
        position: absolute;
        left: 0;
        height: 100%;
        background: var(--color-primary);
        transition: width 0.3s ease;
    }

    .progress-0::before { width: 0; }
    .progress-25::before { width: 25%; }
    .progress-50::before { width: 50%; }
    .progress-75::before { width: 75%; }
    .progress-100::before { width: 100%; }

    #stepContent {
        margin: 2rem auto;
        background: var(--color-white);
        padding: 2rem;
        border-radius: var(--card-border-radius);
        box-shadow: var(--box-shadow);
        transition: all 0.3s ease;
        width: 100%;
        min-height: 600px;
    }

    #stepContent iframe {
        background: transparent;
        transition: all 0.3s ease;
        width: 100%;
        min-height: 600px;
        border: none;
    }

    .form-container {
        width: 100%;
        max-width: none;
        margin: 0;
        padding: 2rem;
    }
</style>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CANCELLATION</title>
</head>

<body>

<div class="container">
    <!-- Sidebar Section -->
    <aside>
        <div class="toggle">
            <div class="logo">
                <img src="http://localhost:8080/untitled_war/resources/Images/athiq.jpg" alt="Logo">

                <h2><span class="danger">JANSHAKTHI</span></h2>
            </div>
            <div class="close" id="close-btn">
                    <span class="material-icons-sharp">
                        close
                    </span>
            </div>
        </div>

        <div class="sidebar">
            <a href="#">
                <h3>DASHBOARD</h3>
            </a>
            <a href="#">
                <h3>CANCELLATION</h3>
            </a>
            <a href="#">
               
                <h3>RENEWAL</h3>
            </a>
            <a href="#">
                   
                <h3>Logout</h3>
            </a>
        </div>
    </aside>
    <!-- NAVA BAR -->

    <!-- DASHBOARD -->
    <main>
        <h1>CANCELLATION</h1>
        
        <!-- Progress Steps -->
        <div class="progress-steps">
            <div class="progress-step active" data-step="1">
                <span>1</span>
                <p>Policy Info</p>
            </div>
            <div class="progress-step" data-step="2">
                <span>2</span>
                <p>Reason</p>
            </div>
            <div class="progress-step" data-step="3">
                <span>3</span>
                <p>Documents</p>
            </div>
            <div class="progress-step" data-step="4">
                <span>4</span>
                <p>Review</p>
            </div>
        </div>
        
        <!-- Progress Bar -->
        <div class="progress-bar progress-0"></div>

        <div class="new-users">
            <div class="user-list">
                <!-- Step Content Container -->
                <div id="stepContent" class="form-container">
                    <!-- Content will be loaded here -->
                </div>
            </div>
        </div>
    </main>

    <div class="right-section">
        <div class="nav">
            <div class="profile">
                <div class="info">
                    <p>Welcome, <b>Athiq</b></p>
                    <small class="text-muted">Super User</small>
                </div>
            </div>

        </div>
        <!-- End of Nav -->


        </div>

    </div>


</div>

<script>
    const sideMenu = document.querySelector('aside');
 


    function loadStep(stepNumber) {
        // Update progress bar
        const progressBar = document.querySelector('.progress-bar');
        progressBar.classList.remove('progress-0', 'progress-25', 'progress-50', 'progress-75', 'progress-100');
        progressBar.classList.add(`progress-${(stepNumber - 1) * 25}`);
        
        // Update progress steps
        document.querySelectorAll('.progress-step').forEach(step => {
            if (parseInt(step.dataset.step) <= stepNumber) {
                step.classList.add('active');
            } else {
                step.classList.remove('active');
            }
        });

        // Load the content from the corresponding JSP file
        const stepContent = document.getElementById('stepContent');
        
        // Create an iframe to load the JSP content
        stepContent.innerHTML = `
            <iframe src="step${stepNumber}.jsp" 
                    style="width: 100%; border: none; height: 600px;" 
                    onload="resizeIframe(this)">
            </iframe>
        `;
    }

    // Function to automatically resize iframe based on content
    function resizeIframe(iframe) {
        iframe.style.height = iframe.contentWindow.document.documentElement.scrollHeight + 'px';
    }

    // Load initial step when page loads
    document.addEventListener('DOMContentLoaded', function() {
        loadStep(1);
    });

    // Handle messages from iframes (for navigation between steps)
    window.addEventListener('message', function(event) {
        if (event.data.type === 'navigation') {
            loadStep(event.data.step);
        }
    });
</script>
</body>

</html>