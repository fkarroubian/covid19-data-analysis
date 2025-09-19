select*
FROM PortfolioProject..CovidDeaths
WHERE continent is NOT NULL

--looking at Total cases vs Total deaths

SELECT country,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathsPercentage
FROM PortfolioProject..CovidDeaths
WHERE country LIKE '%Iran%'
AND total_cases > 0
AND WHERE continent is NOT NULL
ORDER BY 1,2


--looking at Total cases vs population
--show what percentage of population got Covid

SELECT country,date, population,total_cases,(total_cases/population)*100 as PercentagePopulationInfected
FROM PortfolioProject..CovidDeaths
WHERE continent is NOT NULL
ORDER BY 1,2


--Looking at countries with highest infection rate compared to population

SELECT country,population,MAX(total_cases) as highestInfectionCount ,MAX((total_cases/population))*100 as PercentagePopulationInfected
FROM PortfolioProject..CovidDeaths
WHERE continent is NOT NULL
GROUP BY country,population
ORDER BY PercentagePopulationInfected desc


--showing countries with highest death count per population

SELECT country,MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent is NOT NULL
GROUP BY country
ORDER BY TotalDeathCount desc


--Let's break things by continent
-- showing continents with highest death count per population

SELECT continent,MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent is NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount desc


--Global Numbers

SELECT SUM(new_cases) as Total_cases, SUM(cast(new_deaths as int)) As Total_deaths,SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathsPercentage
FROM PortfolioProject..CovidDeaths
WHERE total_cases > 0 and new_cases>0
AND continent is NOT NULL
--GROUP BY date
ORDER BY 1,2




