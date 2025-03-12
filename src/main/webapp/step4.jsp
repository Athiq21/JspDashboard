<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Step 4 - Review & Submit</title>
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

        .review-section {
            margin-bottom: 2rem;
            padding: 1rem;
            background: var(--color-light);
            border-radius: var(--border-radius-1);
        }

        .review-section h3 {
            color: var(--color-dark);
            margin-bottom: 1rem;
            font-size: 1.1rem;
        }

        .review-item {
            display: flex;
            margin-bottom: 0.8rem;
            padding-bottom: 0.8rem;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        }

        .review-item:last-child {
            border-bottom: none;
        }

        .review-label {
            flex: 1;
            color: var(--color-dark-variant);
            font-weight: 500;
        }

        .review-value {
            flex: 2;
            color: var(--color-dark);
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

        .btn-submit {
            background: var(--color-success);
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

        .confirmation-checkbox {
            margin: 2rem 0;
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .confirmation-checkbox input[type="checkbox"] {
            width: 1.2rem;
            height: 1.2rem;
        }

        .confirmation-checkbox label {
            color: var(--color-dark);
            font-size: 0.9rem;
        }

        .edit-link {
            color: var(--color-primary);
            text-decoration: none;
            margin-left: 1rem;
            font-size: 0.9rem;
        }

        .edit-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
        <div class="step-header">
            <div class="step-number">4</div>
            <h2>Review & Submit</h2>
        </div>
        
        <form action="processCancellation" method="POST" id="reviewForm">
            <div class="review-section">
                <h3>Policy Information <a href="step1.jsp" class="edit-link">Edit</a></h3>
                <div id="policyDetails">
                    
                </div>
            </div>

            <div class="review-section">
                <h3>Cancellation Details <a href="step2.jsp" class="edit-link">Edit</a></h3>
                <div id="cancellationDetails">
                </div>
            </div>

            <div class="review-section">
                <h3>Uploaded Documents <a href="step3.jsp" class="edit-link">Edit</a></h3>
                <div id="documentDetails">
                </div>
            </div>

            
            <div class="navigation-buttons">
                <button type="button" class="btn btn-back" onclick="window.location.href='step3.jsp'">Previous Step</button>
                <button type="submit" class="btn btn-submit">Submit Cancellation Request</button>
            </div>
        </form>


    <script>
        function createReviewItem(label, value) {
            return `
                <div class="review-item">
                    <div class="review-label">${label}</div>
                    <div class="review-value">${value}</div>
                </div>
            `;
        }

        window.addEventListener('load', function() {
            // Load Policy Information
            const step1Data = JSON.parse(sessionStorage.getItem('step1Data') || '{}');
            const policyDetails = document.getElementById('policyDetails');
            policyDetails.innerHTML = `
                ${createReviewItem('Policy Number', step1Data.policyNumber || '-')}
                ${createReviewItem('Policy Holder', step1Data.holderName || '-')}
                ${createReviewItem('Issue Date', step1Data.issueDate || '-')}
                ${createReviewItem('Policy Type', step1Data.policyType || '-')}
            `;

            // Load Cancellation Details
            const step2Data = JSON.parse(sessionStorage.getItem('step2Data') || '{}');
            const cancellationDetails = document.getElementById('cancellationDetails');
            cancellationDetails.innerHTML = `
                ${createReviewItem('Cancellation Reason', step2Data.cancellationReason || '-')}
                ${createReviewItem('Explanation', step2Data.explanation || '-')}
                ${createReviewItem('Effective Date', step2Data.effectiveDate || '-')}
            `;

            // Load Document Information
            const step3Data = JSON.parse(sessionStorage.getItem('step3Data') || '{}');
            const documentDetails = document.getElementById('documentDetails');
            documentDetails.innerHTML = `
                ${createReviewItem('Request Letter', step3Data.requestLetter ? '✓ Uploaded' : '✗ Not uploaded')}
                ${createReviewItem('ID Proof', step3Data.idProof ? '✓ Uploaded' : '✗ Not uploaded')}
                ${createReviewItem('Bank Details', step3Data.bankDetails ? '✓ Uploaded' : '- Optional')}
            `;
        });

        document.getElementById('reviewForm').addEventListener('submit', function(e) {
            e.preventDefault();
            alert('Cancellation request submitted successfully!');
            
            sessionStorage.clear();
            window.location.href = 'step1.jsp';
        });
    </script>
</body>
</html> 
