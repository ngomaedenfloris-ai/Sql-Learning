use master
go

create database [Myfinance]
go

use myfinance 
go 

create schema budget
go

create table budget.monthlyBudget
(
monthlyBudgetID int primary key identity(1,1) not null,
monthlyBudgetMonthName varchar(50) not null,
monthlyBudgetMonthIncome money not null,
monthlyBudgetMonthBillsExpenses money not null,
monthlyBudgetMonthSavingsInvestments money not null,
monthlyBudgetMonthDebtsPaid money not null
)
go

create table budget.expenses
(
expensesID int primary key identity(1,1) not null,
expensesName varchar(50) not null,
expensesCaterory varchar(50) not null,
expensesDueDate date not null,
expensesBudget int not null,
expensesActual int not null,
expensesmonthlyBudgetID int foreign key references budget.monthlyBudget(monthlyBudgetID) 
)
go 



