using com.epl.CatalogService from './cat-service';

annotate CatalogService.Teams with @(
  UI: {
    Identification : [name],
    SelectionFields: [name],
      LineItem: [
			  { Value: ID, Label: '{i18n>ID}' },            
        { Value: name, Label: '{i18n>name}' }
      ]
  }
){
	ID @title:'{i18n>ID}' @UI.HiddenFilter;
	name @title:'{i18n>name}';
}

//annotate CatalogService.Teams with @cds.odata.valuelist;