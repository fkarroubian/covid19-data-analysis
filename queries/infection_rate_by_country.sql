select*
FROM PortfolioProject..CovidDeaths


--looking at Total cases vs Total deaths

SELECT country,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathsPercentage
FROM PortfolioProject..CovidDeaths
WHERE country LIKE '%Iran%'
AND total_cases > 0
ORDER BY 1,2


--looking at Total cases vs population
--show what percentage of population got Covid

SELECT country,date, population,total_cases,(total_cases/population)*100 as PercentagePopulationInfected
FROM PortfolioProject..CovidDeaths
--WHERE country LIKE '%Iran%'
ORDER BY 1,2


--Looking at countries with highest infection rate compared to population

SELECT country,population,MAX(total_cases) as highestInfectionCount ,MAX((total_cases/population))*100 as PercentagePopulationInfected
FROM PortfolioProject..CovidDeaths
GROUP BY country,population
ORDER BY PercentagePopulationInfected desc


--showing countries with highest death count per population

SELECT country,MAX(total_cases) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
GROUP BY country
ORDER BY TotalDeathCount desc