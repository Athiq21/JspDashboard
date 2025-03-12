<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <title>Step 3 - Document Upload</title>
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

        .file-upload {
            border: 2px dashed var(--color-info-dark);
            border-radius: var(--border-radius-1);
            padding: 2rem;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .file-upload:hover {
            border-color: var(--color-primary);
        }

        .file-upload span {
            display: block;
            margin-bottom: 1rem;
            color: var(--color-info-dark);
        }

        .file-upload input[type="file"] {
            display: none;
        }

        .upload-list {
            margin-top: 1rem;
        }

        .upload-item {
            display: flex;
            align-items: center;
            padding: 0.5rem;
            background: var(--color-light);
            border-radius: var(--border-radius-1);
            margin-bottom: 0.5rem;
        }

        .upload-item span {
            flex: 1;
            margin-left: 0.5rem;
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

        .required-docs {
            background: var(--color-light);
            padding: 1rem;
            border-radius: var(--border-radius-1);
            margin-bottom: 1.5rem;
        }

        .required-docs h3 {
            margin-bottom: 0.5rem;
        }

        .required-docs ul {
            list-style-type: none;
        }

        .required-docs li {
            margin-bottom: 0.5rem;
            color: var(--color-dark-variant);
        }

        .required-docs li::before {
            content: "•";
            color: var(--color-primary);
            font-weight: bold;
            display: inline-block;
            width: 1em;
            margin-left: -1em;
        }
    </style>
</head>
<body>
        <div class="step-header">
            <div class="step-number">3</div>
            <h2>Document Upload</h2>
        </div>
        
        <form id="documentForm">
            <div class="required-docs">
                <h3>Required Documents</h3>
                <ul>
                    <li>Signed cancellation request letter</li>
                    <li>Policy holder's valid ID proof</li>
                    <li>Bank account details for refund (if applicable)</li>
                </ul>
            </div>

            <div class="form-group">
                <label for="documentType">Document Type</label>
                <select id="documentType" name="documentType" required>
                    <option value="">Select document type</option>
                    <option value="id">Government-issued ID</option>
                    <option value="proof_address">Proof of Address</option>
                    <option value="policy">Policy Document</option>
                    <option value="other">Other Supporting Document</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="documentFile">Upload Document</label>
                <input type="file" id="documentFile" name="documentFile" accept=".pdf,.jpg,.jpeg,.png" required>
                <div id="filePreview"></div>
            </div>
            
            <div class="form-group">
                <label for="comments">Additional Comments</label>
                <textarea id="comments" name="comments" 
                    placeholder="Any additional information about the uploaded documents..."></textarea>
            </div>
            
            <div class="navigation-buttons">
                <button type="button" class="btn btn-back" onclick="goToPreviousStep()">Previous Step</button>
                <button type="button" class="btn btn-next" onclick="goToNextStep()">Next Step</button>
            </div>
        </form>

    <script>
        function goToNextStep() {
            const formData = {
                documentType: document.getElementById('documentType').value,
                comments: document.getElementById('comments').value,
                // We don't store the actual file in session storage, just metadata
                fileInfo: document.getElementById('documentFile').files[0] ? {
                    name: document.getElementById('documentFile').files[0].name,
                    type: document.getElementById('documentFile').files[0].type,
                    size: document.getElementById('documentFile').files[0].size
                } : null
            };
            sessionStorage.setItem('step3Data', JSON.stringify(formData));
            window.parent.postMessage({ type: 'navigation', step: 4 }, '*');
        }

        function goToPreviousStep() {
            window.parent.postMessage({ type: 'navigation', step: 2 }, '*');
        }

        // Load saved data if coming back from later steps
        window.addEventListener('load', function() {
            const savedData = sessionStorage.getItem('step3Data');
            if (savedData) {
                const formData = JSON.parse(savedData);
                document.getElementById('documentType').value = formData.documentType;
                document.getElementById('comments').value = formData.comments;
                // We can't restore the actual file input, but we can show the filename
                if (formData.fileInfo) {
                    document.getElementById('filePreview').textContent = 
                        `Previously uploaded: ${formData.fileInfo.name}`;
                }
            }
        });

        // Preview file when selected
        document.getElementById('documentFile').addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                document.getElementById('filePreview').textContent = `Selected: ${file.name}`;
            }
        });
    </script>
</body>
</html> 