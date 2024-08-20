-- UPDATE jns_perkara SET list_jns_perkara = jsonb_set(list_jns_perkara, '{reg.100}', list_jns_perkara->'reg.1') WHERE id=3;
UPDATE jns_perkara SET list_jns_perkara = jsonb_set(list_jns_perkara, '{reg.100}', list_jns_perkara->'reg.1');
