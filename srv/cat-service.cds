namespace com.epl;

using com.epl as db from '../db/data-model';

service CatalogService {
    entity Teams as projection on db.Teams;
    entity Matches as projection on db.Matches
}

