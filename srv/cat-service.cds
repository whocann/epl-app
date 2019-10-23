namespace com.epl;

using com.epl as db from '../db/data-model';

service CatalogService {
    @readonly
    entity Teams as projection on db.Teams;
    @readonly 
    entity Matches as select from db.Matches {
        *,
        homeTeam.name as homeTeamName,
        awayTeam.name as awayTeamName
    }
        order by matchDate desc;
}

