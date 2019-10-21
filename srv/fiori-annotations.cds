using com.epl.CatalogService from './cat-service';

annotate CatalogService.Matches with @(
  UI:{
    SelectionFields: [],
    LineItem: [
			{ Value: matchDate, Label: 'Date' },            
      { Value: homeTeam.name, Label: 'Home Team' },  
      { Value: homeTeamScore },
      { Value: ':' },
      { Value: awayTeamScore },
      { Value: awayTeam.name, Label: 'Away Team' }
    ]
  }
);