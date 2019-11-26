namespace com.epl;

using com.epl as db from '../db/data-model';

service PublicService {
    @readonly
    entity LeagueTable as select from db.Teams {
        *,
        @Core.Computed
        0 as win: Integer,
        @Core.Computed
        0 as draw: Integer,
        @Core.Computed
        0 as lose: Integer,
        @Core.Computed
        0 as gamesPlayed: Integer,
        @Core.Computed
        0 as points: Integer
    };
    @readonly  
    entity Matches as select from db.Matches
        order by matchDate desc;
}

