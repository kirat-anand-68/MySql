select * from Customers

-- Isnull
select ISNULL(null,'1 st value is null')

select isnull('abx',null)

select isnull(null,null)

select coalesce(null,'B','C')
-- it return the first non null value.

select * from customers
select customerID,Email,PhoneNumber from Customers
select customerID ,isnull(email,'Email NA'),isnull(phonenumber,'phoneneumber NA')from Customers

select customerID ,coalesce(email,phonenumber,'Contact NA') from Customers
-- it check for the email if email is fine the return if null it check for the phonenumber if ok and if null then it check for the contact na.
