declare @monthlyBudgetMonthName varchar(50) = 'January'
declare @monthlyBudgetMonthIncome money = 25000
declare @monthlyBudgetMonthBillsExpenses money = 17141.76
declare @monthlyBudgetMonthSavingsInvestments money = 0.00
declare @monthlyBudgetMonthDebtsPaid money = 0.00

insert into budget.monthlyBudget
           (monthlyBudgetMonthName, 
			monthlyBudgetMonthIncome, 
			monthlyBudgetMonthBillsExpenses,
			monthlyBudgetMonthSavingsInvestments,
			monthlyBudgetMonthDebtsPaid)
values 
            (@monthlyBudgetMonthName,
             @monthlyBudgetMonthIncome,
			 @monthlyBudgetMonthBillsExpenses, 
			 @monthlyBudgetMonthSavingsInvestments,
			 @monthlyBudgetMonthDebtsPaid)
go

select * from budget.monthlyBudget
go
