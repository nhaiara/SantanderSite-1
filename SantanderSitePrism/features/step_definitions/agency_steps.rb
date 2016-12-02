Quando(/^eu clicar no menu inferior "([^"]*)"$/) do |agency|
  @app.agency.click_something(agency)
end

Quando(/^clicar no link "([^"]*)"$/) do |link|
 	@app.agency.click_something(link)
end

Quando(/^preencher o campo CEP$/) do
  @app.agency.last_window
  within_frame(@app.searchAgency.iframe) do
    @app.searchAgency.near.cep.set ADDRESS['NEAR']['CEP']
    sleep 1
  end
end

Quando(/^clicar no botão para buscar agência pelo CEP$/) do
  @app.agency.last_window
  within_frame(@app.searchAgency.iframe) do
    @app.searchAgency.near.search.click
  end
end

Quando(/^selecionar um endereço$/) do
  within_frame(@app.searchAgency.iframe) do
    @app.searchAgency.near.address.select(ADDRESS['NEAR']['ADDRESS'])
  end
end

Então(/^aparecerá as agências disponíveis do CEP$/) do
  page.has_content?(ADDRESS['NEAR']['VERIFY_AGENCY'])
end

Quando(/^clicar na aba para buscar agência no bairro$/) do
  @app.agency.last_window
  within_frame(@app.searchAgency.iframe) do
    @app.searchAgency.neighborhood.neighborhoodTab.click
  end
end

Quando(/^selecionar os dados obrigatórios$/) do
  within_frame(@app.searchAgency.iframe) do
    @app.searchAgency.neighborhood.selectState.select(ADDRESS['NEIGHBORHOOD']['STATE'])
    @app.searchAgency.neighborhood.selectCity.select(ADDRESS['NEIGHBORHOOD']['CITY'])
    @app.searchAgency.neighborhood.selectNeighborhood.select(ADDRESS['NEIGHBORHOOD']['NEIGHBORHOOD'])
  end
end

Quando(/^clicar no botão para buscar agência pelo bairro$/) do
  within_frame(@app.searchAgency.iframe) do
    @app.searchAgency.neighborhood.search.click
  end
end

Então(/^aparecerá as agências disponíveis do bairro$/) do
  page.has_content?(ADDRESS['NEIGHBORHOOD']['VERIFY_AGENCY'])
end

Quando(/^clicar na aba para buscar agência pelo número$/) do
  @app.agency.last_window
  within_frame(@app.searchAgency.iframe) do
    @app.searchAgency.number.numberTab.click
  end
end

Quando(/^preencher os dados obrigatórios$/) do
  within_frame(@app.searchAgency.iframe) do
    @app.searchAgency.number.agencyNumber.set ADDRESS['NUMBER']['AGENCY_NUMBER']
  end
end

Quando(/^clicar no botão para buscar agência pelo número$/) do
  within_frame(@app.searchAgency.iframe) do
    @app.searchAgency.number.search.click
  end
end

Então(/^aparecerá a agência solicitada$/) do
  page.has_content?(ADDRESS['NUMBER']['VERIFY_AGENCY'])
end

Quando(/^clicar na aba para buscar agência por minha rota$/) do
  @app.agency.last_window
  within_frame(@app.searchAgency.iframe) do
    @app.searchAgency.route.routeTab.click
  end
end

Quando(/^preencher o CEP de origem$/) do
  @app.agency.last_window
  within_frame(@app.searchAgency.iframe) do
    @app.searchAgency.route.cepOrigin.set ADDRESS['ROUTE']['CEP_ORIGIN']
    sleep 1
  end
end

Quando(/^clicar no botão para buscar agência pela rota de origem$/) do
  within_frame(@app.searchAgency.iframe) do
      @app.searchAgency.route.searchOrigin.click
  end
end

Quando(/^selecionar um endereço da rota de origem$/) do
  within_frame(@app.searchAgency.iframe) do
      @app.searchAgency.route.addressOrigin.select ADDRESS['ROUTE']['ADDRESS_ORIGIN']
  end
end

Quando(/^preencher o CEP de destino$/) do
  @app.agency.last_window
  within_frame(@app.searchAgency.iframe) do
    @app.searchAgency.route.cepDestiny.set ADDRESS['ROUTE']['CEP_DESTINY']
    sleep 1
  end
end

Quando(/^clicar no botão para buscar agência pela rota de destino$/) do
  within_frame(@app.searchAgency.iframe) do
    @app.searchAgency.route.searchDestiny.click
  end
end

Quando(/^selecionar um endereço da rota de destino$/) do
  within_frame(@app.searchAgency.iframe) do
    @app.searchAgency.route.addressDestiny.select ADDRESS['ROUTE']['ADDRESS_DESTINY']
  end
end

Quando(/^clicar no botão para buscar agências no caminho$/) do
  within_frame(@app.searchAgency.iframe) do
    @app.searchAgency.route.searchWay.click
  end
end

Então(/^aparecerá as agências disponíveis no caminho entre as rotas$/) do
  page.has_content?(ADDRESS['ROUTE']['VERIFY_AGENCY'])
end
