function ds = dynamic_set_auxiliary_series(ds, params)
%
% Status : Computes Auxiliary variables of the dynamic model and returns a dseries
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

ds.AUX_ENDO_LEAD_394=ds.pie4_row(1);
ds.AUX_ENDO_LEAD_398=ds.AUX_ENDO_LEAD_394(1);
ds.AUX_ENDO_LEAD_27=ds.AUX_ENDO_LEAD_398(1);
ds.AUX_ENDO_LEAD_411=ds.piest_row(1);
ds.AUX_ENDO_LEAD_415=ds.AUX_ENDO_LEAD_411(1);
ds.AUX_ENDO_LEAD_45=ds.AUX_ENDO_LEAD_415(1);
ds.AUX_ENDO_LEAD_432=ds.pie4(1);
ds.AUX_ENDO_LEAD_436=ds.AUX_ENDO_LEAD_432(1);
ds.AUX_ENDO_LEAD_137=ds.AUX_ENDO_LEAD_436(1);
ds.AUX_ENDO_LEAD_452=ds.piest(1);
ds.AUX_ENDO_LEAD_456=ds.AUX_ENDO_LEAD_452(1);
ds.AUX_ENDO_LEAD_188=ds.AUX_ENDO_LEAD_456(1);
ds.AUX_ENDO_LAG_5_1=ds.pie_row(-1);
ds.AUX_ENDO_LAG_5_2=ds.AUX_ENDO_LAG_5_1(-1);
ds.AUX_ENDO_LAG_16_1=ds.pie(-1);
ds.AUX_ENDO_LAG_16_2=ds.AUX_ENDO_LAG_16_1(-1);
end
