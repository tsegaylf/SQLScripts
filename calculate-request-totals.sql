ALTER procedure [dbo].[RecalcRequestLines]
as
begin
    declare @id int, @total decimal(18,2);
    declare cur cursor for
        select Id from Requests;
    open cur;
    fetch next from cur into @id;
    while @@FETCH_STATUS = 0
    begin
        select @total = sum(l.quantity * p.price)
            from RequestLines l
            join Products p
                on p.Id = l.ProductId
            where l.RequestId = @id;
        update Requests Set Total = @Total where Id = @id;
        fetch next from cur into @id;
    end;
    close cur;
    deallocate cur;
end
go 
exec [RecalcRequestLines];
go
