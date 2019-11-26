using com.epl.PublicService from './public-service';

annotate publicService.LeagueTable with @(
  UI:{
    Identification: [{ Value: '{i18n>table}' }],
    LineItem: [
	  { Value: name, Label: '{i18n>name}' },            
      { Value: win, Label: '{i18n>win}' },  
      { Value: draw, Label: '{i18n>draw}'  },
      { Value: lose, Label: '{i18n>lose}'  },
      { Value: gamesPlayed, Label: '{i18n>gamesPlayed}'  },
      { Value: points, Label: '{i18n>points}' }
    ]
  }
){
    
}