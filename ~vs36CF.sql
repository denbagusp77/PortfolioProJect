--	select*from projectCovid..CovidDeaths
--	order by 2,3


--Melihat Total Kasus vs total Kematian

select location, date, total_cases, new_cases, total_deaths, (total_deaths/total_cases)*100 as Deathpercentage
from projectCovid..CovidDeaths 
where location LIKE '%STATES%'
order by 1,2


--Melihat Total Kasus vs Populasi
select location, population, MAX(total_cases) as HighestInfectionCount, MAX(total_cases/population)*100 as PercentagePopulationInfected
from projectCovid..CovidDeaths 
group by location, population
order by PercentagePopulationInfected desc

--Menampilkan data tertinggi angka kematian per populasi di dunia

select location, MAX(cast(total_deaths as int)) as HighestDeathCount
from projectCovid..CovidDeaths 
where continent is not null
group by location
order by HighestDeathCount desc

--menampilkan total kasus kematian covid di dunia
select sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths, 
sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from projectCovid..CovidDeaths 
where continent is not null
--group by location
order by 1,2 


select*from projectCovid..CovidVaccinations
--order by 2,3

--melihat total populasi vs vaksinasi
select*from projectCovid..CovidDeaths dea
join projectCovid..CovidVaccinations vac
on dea.location=vac.location 
and dea.date=vac.date
