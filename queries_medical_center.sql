-- Get list of patients with their diagnoses disease/s and corresponding treatments.
SELECT first_name, last_name, name, recommended_treatments
FROM patients p
JOIN diagnoses dgns ON p.id = dgns.patient_id
JOIN diseases d ON dgns.disease_id = d.id
ORDER BY first_name ASC, last_name ASC, name ASC;

-- Get a list of only flu patients.
SELECT first_name, last_name
FROM patients p
JOIN diagnoses dgns ON p.id = dgns.patient_id
JOIN diseases d ON dgns.disease_id = d.id
WHERE d.name = 'Influenza'
ORDER BY first_name ASC, last_name ASC;

-- Get list of doctors with their number of assignments, in descending order of assignment quantity.
SELECT first_name, last_name, COUNT(*) AS num_assignments
FROM doctors d
JOIN assignments a
ON a.dr_id = d.id
GROUP BY first_name, last_name
ORDER BY num_assignments DESC, first_name ASC, last_name ASC;