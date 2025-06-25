--Problem 1
SELECT p.PetType,
	ROUND(AVG(ph.AgeMonths/12.0),2) AS AVGAGEYEARS,
	ROUND(AVG(a.TimeInShelterDays),2) AS AvgDaysInShelter,
FROM Pet p
JOIN PetHealth ph ON p.PetId = ph.PetID
JOIN Adoption a ON p.PetID = a.PetID
GROUP BY p.PetType
ORDER BY AvgAgeYears DESC;

--Problem 2
SELECT p.PetType,
     	COUNT(p.PetType) AS animal_number,
      	ROUND(AVG(a2.TimeInShelterDays),2) AS AVG_TimeInShelterDays
FROM Adoption a2
JOIN Pet p ON a2.PetID = p.PetID 
GROUP BY p.PetType
ORDER BY AVG_TimeInShelterDays DESC;

--Problem 3
SELECT p.PetType, p.PreviousOwner, ROUND(AVG(a.AdoptionFee),2) AS AvgAdoptionFee 
FROM Pet p 
JOIN Adoption a ON a.PetID = p.PetID 
GROUP BY p.PreviousOwner, p.PetType 
ORDER BY p.PetType, a.AdoptionFee DESC; 

--Problem 4
SELECT PetType, Breed, COUNT(*) AS PetTotal,
ROUND(AVG(a.AdoptionFee),2) AS AVG_AdoptionFee
FROM Pet p
JOIN Adoption a ON a.PetID = p.PetID
GROUP BY PetType, Breed
ORDER BY AVG_AdoptionFee DESC;

--Problem 5
SELECT
	ph.Vaccinated,
	ph.HealthCondition,
	p.PreviousOwner,
	ROUND(AVG (a.AdoptionLikelihood),2) AS adoption_rate,
	COUNT(*) AS sample_size
FROM PetHealth ph
JOIN Pet p ON ph.PetID = p.PetID
JOIN Adoption a ON ph.PetID = a.PetID
GROUP BY
	ph.Vaccinated,
	ph.HealthCondition,
	p.PreviousOwner
ORDER BY adoption_rate DESC;

