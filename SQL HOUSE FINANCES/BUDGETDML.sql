insert into budget.monthlyBudget(monthlyBudgetMonthName, monthlyBudgetMonthIncome, monthlyBudgetMonthBillsExpenses,monthlyBudgetMonthSavingsInvestments,monthlyBudgetMonthDebtsPaid)
                         values ('January',              25000.00,                17141.76,                        0.00,                                0.00)
go

select * from budget.monthlyBudget
go

---------------------------------------

insert into budget.expenses(expensesName,        expensesCaterory,     expensesDueDate, expensesBudget, expensesActual, expensesmonthlyBudgetID)
        			values ('Electricity Bill', 'Bills',              '2025/01/01',     1000,           700,            1)
go

select *from budget.expenses
go
