Select *
From Portfolio_Project..Coviddeath
Where continent is not null
Order by 3,4

-- verified the covid the data was imported correctly
--Select *
--From Portfolio_Project..CovidVaccination
--Order by 3,4

Select location, date, total_cases, new_cases, total_deaths, population
From Portfolio_Project..Coviddeath
Where continent is not null
Order by 1,2

--Looking at the Total cases vs Total Death

ALTER TABLE Portfolio_Project..Coviddeath
ALTER COLUMN total_deaths FLOAT

ALTER TABLE Portfolio_Project..Coviddeath
ALTER COLUMN total_cases FLOAT

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From Portfolio_Project..Coviddeath
Where continent is not null
Order by 1,2

-- Looking at the likelihood of dying if you contact covid in the United states

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From Portfolio_Project..Coviddeath 
where location = 'United States'
Order by 1,2

-- Looking at the likelihood of dying if you contact Covid in Nigeria

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From Portfolio_Project..Coviddeath 
where location = 'Nigeria'
Order by 1,2

-- Looking at the likelihood of dying if you contact covid in China

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From Portfolio_Project..Coviddeath 
where location = 'China'
Order by 1,2

-- Looking at the total cases versus the poputlation
-- shows what percentage of population got covid

Select location, date, total_cases, total_deaths, population, (total_cases/population)*100 as Covid_Percentage
From Portfolio_Project..Coviddeath 
Where continent is not null
Order by 1,2

Select location, Population, MAX(total_cases) as Highest_Infection, MAX(total_cases/population)*100 as Covid_Population
From Portfolio_Project..Coviddeath 
Where continent is not null
Group by Location, population
Order by Covid_Population Desc

-- Looking at the total cases versus the population in  the united state
Select location, date, total_cases, total_deaths, population, (total_cases/population)*100 as Covid_Percentage
From Portfolio_Project..Coviddeath 
where location = 'United States'
Order by 1,2

-- Looking at the total cases versus the population in Nigeria
Select location, date, total_cases, total_deaths, population, (total_cases/population)*100 as Covid_Percentage
From Portfolio_Project..Coviddeath 
where location = 'Nigeria'
Order by 1,2

-- Looking at the total cases versus the population in China
Select location, date, total_cases, total_deaths, population, (total_cases/population)*100 as Covid_Percentage
From Portfolio_Project..Coviddeath 
where location = 'China'
Order by 1,2

-- Showing the countries with the highest death count per population

Select location, MAX(total_deaths) as Total_death_count
From Portfolio_Project..Coviddeath
Where continent is not null
Group by Location
Order by Total_death_count Desc

-- Lets break this down by continent

Select continent, MAX(total_deaths) as Total_death_count
From Portfolio_Project..Coviddeath
Where continent is not null
Group by continent
Order by Total_death_count Desc

--Showing the continent with the highest death count per popualation

Select *
From Portfolio_Project..Coviddeath
Where continent is not null
Order by 3,4

-- verified the covid the data was imported correctly
--Select *
--From Portfolio_Project..CovidVaccination
--Order by 3,4

Select location, date, total_cases, new_cases, total_deaths, population
From Portfolio_Project..Coviddeath
Where continent is not null
Order by 1,2

--Looking at the Total cases vs Total Death

--ALTER TABLE Portfolio_Project..Coviddeath
--ALTER COLUMN total_deaths FLOAT

--ALTER TABLE Portfolio_Project..Coviddeath
--ALTER COLUMN total_cases FLOAT

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From Portfolio_Project..Coviddeath
Where continent is not null
Order by 1,2

-- Looking at the likelihood of dying if you contact covid in the United states

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From Portfolio_Project..Coviddeath 
where location = 'United States'
Order by 1,2

-- Looking at the likelihood of dying if you contact Covid in Nigeria

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From Portfolio_Project..Coviddeath 
where location = 'Nigeria'
Order by 1,2

-- Looking at the likelihood of dying if you contact covid in China

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From Portfolio_Project..Coviddeath 
where location = 'China'
Order by 1,2

-- Looking at the total cases versus the poputlation
-- shows what percentage of population got covid

Select location, date, total_cases, total_deaths, population, (total_cases/population)*100 as Covid_Percentage
From Portfolio_Project..Coviddeath 
Where continent is not null
Order by 1,2

Select location, Population, MAX(total_cases) as Highest_Infection, MAX(total_cases/population)*100 as Covid_Population
From Portfolio_Project..Coviddeath 
Where continent is not null
Group by Location, population
Order by Covid_Population Desc

-- Looking at the total cases versus the population in  the united state

Select location, date, total_cases, total_deaths, population, (total_cases/population)*100 as Covid_Percentage
From Portfolio_Project..Coviddeath 
where location = 'United States'
Order by 1,2

-- Looking at the total cases versus the population in Nigeria

Select location, date, total_cases, total_deaths, population, (total_cases/population)*100 as Covid_Percentage
From Portfolio_Project..Coviddeath 
where location = 'Nigeria'
Order by 1,2

-- Looking at the total cases versus the population in China

Select location, date, total_cases, total_deaths, population, (total_cases/population)*100 as Covid_Percentage
From Portfolio_Project..Coviddeath 
where location = 'China'
Order by 1,2

-- Showing the countries with the highest death count per population

Select location, MAX(total_deaths) as Total_death_count
From Portfolio_Project..Coviddeath
Where continent is not null
Group by Location
Order by Total_death_count Desc

-- Lets break this down by continent

Select continent, MAX(total_deaths) as Total_death_count
From Portfolio_Project..Coviddeath
Where location = 'United States' and continent is not null
Group by continent
Order by Total_death_count Desc

-- Global numbers

Select date, sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_death, 
sum(cast(new_deaths as int)) / nullif (sum(new_cases), 0) * 100 as new_death_percentages
From Portfolio_Project..Coviddeath
Where continent is not null
Group by date
Order by 1,2

-- To identify the total numner of cases, total number of death and percentage of death from cases

Select sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_death, 
sum(cast(new_deaths as int)) / nullif (sum(new_cases), 0) * 100 as new_death_percentages
From Portfolio_Project..Coviddeath
Where continent is not null
Order by 1,2


Select  * 
From Portfolio_Project..Coviddeath dea
join Portfolio_Project..CovidVaccination vac
	On dea.location = vac.location
	and dea.date = vac.date

-- Looking at total population vs vaccination

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
From Portfolio_Project..Coviddeath dea
join Portfolio_Project..CovidVaccination vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
order by 2,3


-- Showing the count of new vacination to show total vaccinated people

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, sum(cast(coalesce(vac.new_vaccinations,0) as bigint)) OVER (Partition by dea.location order by dea.location , dea.date) as Rolling_people_vaccinated
From Portfolio_Project..Coviddeath dea
join Portfolio_Project..CovidVaccination vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
order by 2,3

-- To indicate the percentage of population vaccinated
-- We need to create a CTE or a Temptable to make use of a new column

-- USE A CTE
with Pop_vs_Vac (continent, location, date, population, new_vaccinations, Rolling_people_vaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, sum(cast(coalesce(vac.new_vaccinations,0) as bigint)) OVER (Partition by dea.location order by dea.location , dea.date) as 
Rolling_people_vaccinated 
From Portfolio_Project..Coviddeath dea
join Portfolio_Project..CovidVaccination vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
--order by 2,3
)
Select * , (Rolling_people_vaccinated/population)*100 as Percentage_vaccinated
From Pop_vs_Vac

-- TEMP TABLE

DROP TABLE IF EXISTS #Percentage_Population_Vaccinated
Create Table #Percentage_Population_Vaccinated
(
continent nvarchar(255),
location nvarchar(255),
Date datetime,
Population numeric,
new_vaccination numeric,
Rolling_people_vaccinated numeric
)

INSERT INTO #Percentage_Population_Vaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, sum(cast(coalesce(vac.new_vaccinations,0) as bigint)) OVER (Partition by dea.location order by dea.location , dea.date) as 
Rolling_people_vaccinated 
From Portfolio_Project..Coviddeath dea
join Portfolio_Project..CovidVaccination vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
--order by 2,3

Select * , (Rolling_people_vaccinated/population)*100 as Percentage_vaccinated
From #Percentage_Population_Vaccinated

-- Creating view to store data for later visualisation

-- Drop view Percentage_Population_Vaccinated

Create View Percentage_Population_Vaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, sum(cast(coalesce(vac.new_vaccinations,0) as bigint)) OVER (Partition by dea.location order by dea.location , dea.date) as 
Rolling_people_vaccinated 
From Portfolio_Project..Coviddeath dea
join Portfolio_Project..CovidVaccination vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
--order by 2,3

Select *
from Percentage_Population_Vaccinated