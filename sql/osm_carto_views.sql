CREATE OR REPLACE VIEW openrailwaymap_osm_line AS
  SELECT
    osm_id,
    way,
    railway,
    tags->'public_transport' AS public_transport,
    tags->'usage' AS usage,
    service,
    construction,
    tunnel,
    bridge,
    tags->'maxspeed' AS maxspeed,
    tags->'maxspeed:forward' AS maxspeed_forward,
    tags->'maxspeed:backward' AS maxspeed_backward,
    tags->'railway:preferred_direction' AS preferred_direction,
    ref,
    name,
    z_order,
    tags
  FROM planet_osm_line;

CREATE OR REPLACE VIEW openrailwaymap_osm_polygon AS
  SELECT
    osm_id,
    way,
    railway,
    tags->'public_transport' AS public_transport,
    name,
    tags AS tags,
    way_area
  FROM planet_osm_polygon;

CREATE OR REPLACE VIEW openrailwaymap_osm_point AS
  SELECT
    osm_id,
    way,
    railway,
    ref,
    tags->'railway:position' AS "railway_position",
    tags->'railway:position:detail' AS "railway_position_detail",
    man_made,
    tags->'public_transport' AS public_transport,
    name,
    tags->'railway:signal:direction'   AS "signal_direction",
    tags->'railway:signal:speed_limit'       AS "signal_speed_limit",
    tags->'railway:signal:speed_limit:form'  AS "signal_speed_limit_form",
    tags->'railway:signal:speed_limit:speed' AS "signal_speed_limit_speed",
    tags->'railway:signal:speed_limit_distant'       AS "signal_speed_limit_distant",
    tags->'railway:signal:speed_limit_distant:form'  AS "signal_speed_limit_distant_form",
    tags->'railway:signal:speed_limit_distant:speed' AS "signal_speed_limit_distant_speed",
    tags AS tags
  FROM planet_osm_point;

CREATE OR REPLACE VIEW openrailwaymap_osm_signals AS
  SELECT
    osm_id,
    way,
    railway,
    ref,
    string_to_array(ref, ' ') AS ref_multiline,
    tags->'railway:signal:direction'   AS "signal_direction",
    tags AS tags
  FROM planet_osm_point;
