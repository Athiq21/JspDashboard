<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Step 1 - Policy Information</title>
    <style>
        :root {
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

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: var(--color-background);
            padding: 2rem;
        }

        .step-container {
            max-width: 800px;
            margin: 0 auto;
            background: var(--color-white);
            padding: var(--card-padding);
            border-radius: var(--card-border-radius);
            box-shadow: var(--box-shadow);
        }

        .step-header {
            display: flex;
            align-items: center;
            margin-bottom: 2rem;
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
            margin-right: 1rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: var(--color-dark);
            font-weight: 500;
        }

        input[type="text"], 
        input[type="date"] {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid var(--color-info-dark);
            border-radius: var(--border-radius-1);
            font-size: 1rem;
            margin-bottom: 0.5rem;
        }

        .navigation-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 2rem;
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: var(--border-radius-1);
            cursor: pointer;
            font-size: 1rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-next {
            background: var(--color-primary);
            color: var(--color-white);
        }

        .btn-back {
            background: var(--color-light);
            color: var(--color-dark);
        }

        .btn:hover {
            opacity: 0.8;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>

        <div class="step-header">
            <div class="step-number">1</div>
            <h2>Policy Information</h2>
        </div>
        
        <form id="policyForm">
            <div class="form-group">
                <label for="policyNumber">Policy Number</label>
                <input type="text" id="policyNumber" name="policyNumber" required>
            </div>
            
            <div class="form-group">
                <label for="holderName">Policy Holder Name</label>
                <input type="text" id="holderName" name="holderName" required>
            </div>
            
            <div class="form-group">
                <label for="issueDate">Policy Issue Date</label>
                <input type="date" id="issueDate" name="issueDate" required>
            </div>
            
            <div class="form-group">
                <label for="policyType">Policy Type</label>
                <input type="text" id="policyType" name="policyType" required>
            </div>
            
            <div class="navigation-buttons">
                <button type="button" class="btn btn-next" onclick="goToNextStep()">Next Step</button>
            </div>
        </form>
  

    <script>
        // Save form data to session storage before submitting
        function goToNextStep() {
            const formData = {
                policyNumber: document.getElementById('policyNumber').value,
                holderName: document.getElementById('holderName').value,
                issueDate: document.getElementById('issueDate').value,
                policyType: document.getElementById('policyType').value
            };
            sessionStorage.setItem('step1Data', JSON.stringify(formData));
            window.parent.postMessage({ type: 'navigation', step: 2 }, '*');
        }

        // Load saved data if coming back from later steps
        window.addEventListener('load', function() {
            const savedData = sessionStorage.getItem('step1Data');
            if (savedData) {
                const formData = JSON.parse(savedData);
                document.getElementById('policyNumber').value = formData.policyNumber;
                document.getElementById('holderName').value = formData.holderName;
                document.getElementById('issueDate').value = formData.issueDate;
                document.getElementById('policyType').value = formData.policyType;
            }
        });
    </script>
</body>
</html> 