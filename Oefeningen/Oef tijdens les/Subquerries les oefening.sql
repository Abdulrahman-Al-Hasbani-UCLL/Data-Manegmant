-- zonder subquerry: vraag 1 subquerries
select AR."Name"
from chinook."Artist" AR inner join 
chinook."Album" Al on Al."ArtistId" = AR."ArtistId" inner join
chinook."Track" TR on TR."AlbumId" = Al."AlbumId" left join
chinook."Genre" G on G."GenreId" = TR."GenreId" AND lower(G."Name") = 'pop'
where G."Name" is null
group by AR."Name";

select AR."Name"
from chinook."Artist" AR
where AR."ArtistId" not in (select AR."ArtistId"
						   from chinook."Track" Tr
							inner join chinook."Album" AL on Tr."AlbumId" = AL."AlbumId"
							inner join chinook."Artist" AR on AR."ArtistId" = AL."ArtistId"
						   inner join chinook."Genre" G on G."GenreId" = Tr."GenreId" And lower(G."Name") = ('pop')
						   )