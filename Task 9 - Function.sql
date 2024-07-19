select * from sales


create OR replace function getPercentageProfit(productId varchar)
RETURNS TABLE(total_sales double precision, 
	total_profit double precision, 
	profit_percentage double precision) AS $$
BEGIN
	return query
    select 
        sum(sales) AS total_sales,
        sum(profit) AS total_profit,
        sum(profit) / sum (sales) * 100 AS profit_percentage
    FROM
        sales
    WHERE
        product_id = productId;
	
END;
$$ LANGUAGE plpgsql;

select getPercentageProfit('FUR-CH-10000454');

DROP FUNCTION getpercentageprofit(character varying)