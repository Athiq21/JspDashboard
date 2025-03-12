<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Step 2 - Cancellation Reason</title>
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

        select, textarea {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid var(--color-info-dark);
            border-radius: var(--border-radius-1);
            font-size: 1rem;
            margin-bottom: 0.5rem;
        }

        textarea {
            min-height: 150px;
            resize: vertical;
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
            <div class="step-number">2</div>
            <h2>Cancellation Reason</h2>
        </div>
        
        <form id="reasonForm">
            <div class="form-group">
                <label for="cancellationReason">Primary Reason for Cancellation</label>
                <select id="cancellationReason" name="cancellationReason" required>
                    <option value="">Select a reason</option>
                    <option value="better_rate">Found Better Rate Elsewhere</option>
                    <option value="dissatisfied">Dissatisfied with Service</option>
                    <option value="no_longer_needed">Policy No Longer Needed</option>
                    <option value="financial">Financial Constraints</option>
                    <option value="other">Other</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="explanation">Detailed Explanation</label>
                <textarea id="explanation" name="explanation" required 
                    placeholder="Please provide more details about your reason for cancellation..."></textarea>
            </div>
            
            <div class="form-group">
                <label for="effectiveDate">Requested Cancellation Date</label>
                <input type="date" id="effectiveDate" name="effectiveDate" required>
            </div>
            
            <div class="navigation-buttons">
                <button type="button" class="btn btn-back" onclick="goToPreviousStep()">Previous Step</button>
                <button type="button" class="btn btn-next" onclick="goToNextStep()">Next Step</button>
            </div>
        </form>

    <script>
        function goToNextStep() {
            const formData = {
                cancellationReason: document.getElementById('cancellationReason').value,
                explanation: document.getElementById('explanation').value,
                effectiveDate: document.getElementById('effectiveDate').value
            };
            sessionStorage.setItem('step2Data', JSON.stringify(formData));
            window.parent.postMessage({ type: 'navigation', step: 3 }, '*');
        }

        function goToPreviousStep() {
            window.parent.postMessage({ type: 'navigation', step: 1 }, '*');
        }

        // Load saved data if coming back from later steps
        window.addEventListener('load', function() {
            const savedData = sessionStorage.getItem('step2Data');
            if (savedData) {
                const formData = JSON.parse(savedData);
                document.getElementById('cancellationReason').value = formData.cancellationReason;
                document.getElementById('explanation').value = formData.explanation;
                document.getElementById('effectiveDate').value = formData.effectiveDate;
            }
        });
    </script>
</body>
</html> 