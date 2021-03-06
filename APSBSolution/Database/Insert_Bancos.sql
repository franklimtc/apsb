a/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

--Bancos 

INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco do Brasil',1);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco da Amazonia',3);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco do Nordeste do Brasil',4);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Standard de Investimentos',12);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Natixis Brasil Banco Múltiplo',14);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Azteca do Brasil S.A',19);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banestes Banco do Estado do Espírito Santo',21);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco de Pernambuco – BANDEPE',24);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Alfa S.A',25);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Banerj S.A',29);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Beg',31);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Santander (Brasil) S.A',33);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Bradesco BBI',36);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco do Estado do Pará S.A',37);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Cargil S.A',40);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco do Estado do Rio Grade do Sul',41);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco BVA S.A',44);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Opportunity',45);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco do Estado de Sergipe S.A',47);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Hipercard Banco Múltiplo S.A',62);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco IBI – Banco Múltiplo',63);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Lemon S.A',65);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Morgan Stanley S.A',66);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('BPN Brasil Banco Múltiplo',69);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('BRB – Banco de Brasilia S.A',70);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Rural Mais S.A',72);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('BB Banco Popular do Brasil',73);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco J. Safra S.A',74);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco CR2 S/A',75);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco KEB do Brasil S.A',76);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Inter S/A',77);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('BES Investimentos do Brasil',78);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('JBS Banco S/A',79);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Concórdia Banco',81);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Topázio S.A',82);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco da China Brasil S.A',83);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco BM&F de Serviços de Liquidação e Custodia',96);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Caixa Econômica Federal',104);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco BBM S/A',107);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Nossa Caixa S.A',151);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Itaú BBA',184);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Bradesco Cartões',204);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco UBS Pactual',208);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Matone',212);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Arbi',213);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Dibens S.A',214);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Comercial e de Investimento Sudameris',215);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco John Deere',217);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Bonsucesso',218);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Calyon brasil',222);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Fibra S.A',224);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Brascan',225);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Cruzeiro Do Sul',229);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Unicard Banco Múltiplo',230);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco GE Capital',233);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Bradesco',237);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Classico',241);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Máxima',243);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco ABC Brasil',246);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Boavista Interatlantico S.A',248);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Investicred Unibanco',249);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Schahin',250);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Paraná Banco',254);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Cacique',263);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Fator S.A',265);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Cedula S.A',266);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco de La Nacion Argentina',300);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco BMG',318);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Industrial e Comercial S.A',320);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Itaú S.A',341);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Societé Generale Brasil',366);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Westlb do Brasil S.A',370);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco J.P. Morgan',376);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Mercantil do Brasil',389);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Finasa BMC',394);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('HSBC Bank Brasil – Banco Múltiplo',399);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Unibanco-União de Bancos Brasileiros S.A',409);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Capital',412);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Safra',422);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Rural S.A',453);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco de Tokyo-Mitsubishi UFJ Brasil S/A',456);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Sumitomo Mitsui Brasileiro S.A',464);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Caixa Geral – Brasil',473);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Citibank N.A.',477);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Itaubank S.A',479);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Deutsche Bank – Banco Alemao',487);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('JPMorgan Chase Bank, National Association',488);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Ing Bank N.V.',492);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco de la Republica Oriental del Uruguay',494);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco de la Provincia de Buenos Aires',495);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Credit Suisse (Brasil)',505);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Luso Brasileiro S.A',600);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Industrial Do Brasil S.A',604);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco VR S.A',610);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Paulista',611);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Guanabara',612);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Pecunia S.A',613);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Panamericano',623);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Ficsa S.A',626);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Intercap S.A',630);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Rendimento',633);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Triangulo',634);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Sofisa S.A',637);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Prosper',638);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Alvorada',641);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Pine',643);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Itaú Unibanco Banco Múltiplo S.A',652);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Indusval',653);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco A.J. Renner S.A',654);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Votorantim S.A',655);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Daycoval',707);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banif – Banco Internacional do Funchal (Brasil), S.A',719);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Credibel',721);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Gerdau S.A',734);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Pottencial S.A',735);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Morada S.A',738);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco BGN',739);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Barclays S.A',740);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Ribeirao Preto S.A',741);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Semear',743);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Citibank',745);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Modal S.A',746);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Rabobank International Brasil S.A',747);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Cooperativo Sicredi',748);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Simples S.A',749);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Dresdner Bank Brasil Banco Multiplo',751);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco BNP Paribas Brasil S.A',752);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('NBC Bank Brasil S. A. – Banco Múltiplo',753);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco Cooperativo do Brasil – Bancoob',756);
INSERT INTO tbBancos(ccBanco, cvCodBanco) VALUES('Banco KEB do Brasil',757);

--Especialidades

INSERT INTO tbEspecialidade(Especialidade) VALUES('Angiologista');
INSERT INTO tbEspecialidade(Especialidade) VALUES('Cardiologista');
INSERT INTO tbEspecialidade(Especialidade) VALUES('Clínico geral');
INSERT INTO tbEspecialidade(Especialidade) VALUES('Dentista');
INSERT INTO tbEspecialidade(Especialidade) VALUES('Dermatologista');
INSERT INTO tbEspecialidade(Especialidade) VALUES('Endrocrinologista');
INSERT INTO tbEspecialidade(Especialidade) VALUES('Fisioterapeuta');
INSERT INTO tbEspecialidade(Especialidade) VALUES('Fonoaudiólogo');
INSERT INTO tbEspecialidade(Especialidade) VALUES('Ginecologista');
INSERT INTO tbEspecialidade(Especialidade) VALUES('Nutricionista');
INSERT INTO tbEspecialidade(Especialidade) VALUES('Ortopedista');
INSERT INTO tbEspecialidade(Especialidade) VALUES('Pediatra');
INSERT INTO tbEspecialidade(Especialidade) VALUES('Pneumologista');
INSERT INTO tbEspecialidade(Especialidade) VALUES('Psicólogo');
INSERT INTO tbEspecialidade(Especialidade) VALUES('Radiologista');
INSERT INTO tbEspecialidade(Especialidade) VALUES('Reumatologista');
INSERT INTO tbEspecialidade(Especialidade) VALUES('Urologista');


--Tipos de Despesas


INSERT INTO tbDespesaTipo(ccTipo) VALUES('Agefis APSB');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Agefis DMA');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('ALG NF');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Aline Brindes E Presentes');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Aline MEI');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Arte Publicidade Propaganda');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Celebrate');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Celebrate DMA');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Certificado Digital ASB');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Certificado Digital DMA ');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('DMA');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('DMA NF');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Domínio APSB (Registro.Br)');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Domínio DMA (Registro.Br)');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Gps ALG');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Gps APSB');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Gps DMA');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Honorários Da Contabilidade ALG');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Honorários Da Contabilidade APSB');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Honorários Da Contabilidade APSDF');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Honorários Da Contabilidade DMA');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Imprensa Nacional');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('ISS APSB');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('ISS DMA');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Jurídico');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Marilia');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Michele MEI');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Murilo PF');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Myrella - Produções Gráficas');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Ney');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Pacote De Serviços BB');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Simples ALG');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Simples DMA');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Simples Nac. Aline');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Simples Nacional Michele');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Site');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Tfe Anual APSB');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Tfe Anual DMA');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Treinamento');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('VHSYS');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('VHSYS DMA');
INSERT INTO tbDespesaTipo(ccTipo) VALUES('Vivo');
