<!DOCTYPE html>
<html>
<head>
<style>
table {
  border-collapse: collapse;
  width: 100%;
  display: none; /* Hide the table */
}

th, td {
  border: 1px solid black;
  text-align: center;
  padding: 8px;
}

th {
  background-color: #f2f2f2;
}

select {
  width: 100%;
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 3px;
  position: relative; /* Ensure the dropdown is positioned relative to its normal position */
  z-index: 1; /* Ensure the dropdown is on top of other elements */ 
}

#result {
  margin-top: 20px;
}
</style>
</head>
<body>

<h2>RFL-C500 CW Fiber Laser (25μm)</h2>

<table>
  <tr>
    <th>Material</th>
    <th>Thickness (mm)</th>
    <th>Power (W)</th>
    <th>Speed (m/min)</th>
    <th>Gas Pressure (bar)</th>
    <th>Nozzle (mm)</th>
    <th>Focus Position (mm)</th>
    <th>Cutting Height (mm)</th>
  </tr>
  <tr>
    <td>Carbon Steel</td>
    <td>0.8</td>
    <td>500</td>
    <td>12</td>
    <td>10</td>
    <td>1.5S</td>
    <td>0</td>
    <td>1</td>
  </tr>
  <tr>
    <td>Carbon Steel</td>
    <td>1</td>
    <td>500</td>
    <td>10</td>
    <td>10</td>
    <td>1.5S</td>
    <td>0</td>
    <td>1</td>
  </tr>
  <tr>
    <td>Carbon Steel</td>
    <td>2</td>
    <td>500</td>
    <td>3.5</td>
    <td>0.6</td>
    <td>1.2D</td>
    <td>+3</td>
    <td>0.8</td>
  </tr>
  <tr>
    <td>Carbon Steel</td>
    <td>3</td>
    <td>500</td>
    <td>2</td>
    <td>0.6</td>
    <td>1.2D</td>
    <td>+3</td>
    <td>0.8</td>
  </tr>
  <tr>
    <td>Carbon Steel</td>
    <td>4</td>
    <td>500</td>
    <td>1.5</td>
    <td>0.6</td>
    <td>1.5D</td>
    <td>+3</td>
    <td>0.8</td>
  </tr>
  <tr>
    <td>Carbon Steel</td>
    <td>5</td>
    <td>500</td>
    <td>1.0</td>
    <td>0.6</td>
    <td>2.0D</td>
    <td>+3</td>
    <td>0.8</td>
  </tr>
  <tr>
    <td>Carbon Steel</td>
    <td>6</td>
    <td>500</td>
    <td>0.8</td>
    <td>0.6</td>
    <td>2.5D</td>
    <td>+3</td>
    <td>0.8</td>
  </tr>
  <tr>
    <td>Stainless Steel</td>
    <td>0.5</td>
    <td>500</td>
    <td>24</td>
    <td>12</td>
    <td>1.2S</td>
    <td>0</td>
    <td>1</td>
  </tr>
  <tr>
    <td>Stainless Steel</td>
    <td>1</td>
    <td>500</td>
    <td>12</td>
    <td>12</td>
    <td>1.2S</td>
    <td>0</td>
    <td>1</td>
  </tr>
  <tr>
    <td>Stainless Steel</td>
    <td>1.5</td>
    <td>500</td>
    <td>8</td>
    <td>12</td>
    <td>1.2S</td>
    <td>0</td>
    <td>1</td>
  </tr>
  <tr>
    <td>Stainless Steel</td>
    <td>2</td>
    <td>500</td>
    <td>6</td>
    <td>12</td>
    <td>1.2S</td>
    <td>0</td>
    <td>1</td>
  </tr>
</table>

<div>
  <label for="material">Select Material:</label>
  <select id="material">
    <option value="">Select</option>
    <option value="Carbon Steel">Carbon Steel</option>
    <option value="Stainless Steel">Stainless Steel</option>
  </select>

  <label for="thickness">Select Thickness (mm):</label>
  <select id="thickness">
    <option value="">Select</option>
  </select>

  <label for="power">Select Power (W):</label>
  <select id="power">
    <option value="">Select</option>
  </select>
</div>

<button onclick="calculate()">Calculate</button>

<div id="result">
  <h3>Results:</h3>
  <p>Speed (m/min): <span id="speed"></span></p>
  <p>Gas Pressure (bar): <span id="gasPressure"></span></p>
  <p>Nozzle (mm): <span id="nozzle"></span></p>
  <p>Focus Position (mm): <span id="focusPosition"></span></p>
  <p>Cutting Height (mm): <span id="cuttingHeight"></span></p>
</div>

<script>
function calculate() {
  const material = document.getElementById('material').value;
  const thickness = document.getElementById('thickness').value;
  const power = document.getElementById('power').value;

  // Get the table rows
  const rows = document.querySelectorAll('table tr');

  // Find the matching row
  let matchingRow = null;
  for (let i = 1; i < rows.length; i++) { // Skip the header row
    const cells = rows[i].cells;
    if (cells[0].innerText === material && 
        cells[1].innerText === thickness && 
        cells[2].innerText === power) {
      matchingRow = rows[i];
      break;
    }
  }

  if (matchingRow) {
    // Extract the results
    const speed = matchingRow.cells[3].innerText;
    const gasPressure = matchingRow.cells[4].innerText;
    const nozzle = matchingRow.cells[5].innerText;
    const focusPosition = matchingRow.cells[6].innerText;
    const cuttingHeight = matchingRow.cells[7].innerText;

    // Display the results
    document.getElementById('speed').innerText = speed;
    document.getElementById('gasPressure').innerText = gasPressure;
    document.getElementById('nozzle').innerText = nozzle;
    document.getElementById('focusPosition').innerText = focusPosition;
    document.getElementById('cuttingHeight').innerText = cuttingHeight;
  } else {
    // Handle no match
    document.getElementById('result').innerHTML = "<h3>No matching data found.</h3>";
  }
}

// Dynamically populate Thickness and Power select options based on Material
document.getElementById('material').addEventListener('change', function() {
  const selectedMaterial = this.value;
  const thicknessSelect = document.getElementById('thickness');
  const powerSelect = document.getElementById('power');

  thicknessSelect.innerHTML = '<option value="">Select</option>';
  powerSelect.innerHTML = '<option value="">Select</option>';

  if (selectedMaterial) {
    const rows = document.querySelectorAll('table tr');
    for (let i = 1; i < rows.length; i++) { // Skip the header row
      if (rows[i].cells[0].innerText === selectedMaterial) {
        const thickness = rows[i].cells[1].innerText;
        const power = rows[i].cells[2].innerText;

        // Add unique thickness and power options
        if (!thicknessSelect.querySelector(`option[value="${thickness}"]`)) { 
          thicknessSelect.innerHTML += `<option value="${thickness}">${thickness}</option>`; 
        }
        if (!powerSelect.querySelector(`option[value="${power}"]`)) {
          powerSelect.innerHTML += `<option value="${power}">${power}</option>`;
        }
      }
    }
  }
});
</script>

</body>
</html>
