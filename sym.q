/ define table schema.
smart_meter:([msn:`s#`symbol$()]name:`symbol$();mt:`g#`symbol$();cap:`int$();icap:`int$())
usage:([]timestamp:`s#`timestamp$();msn:`g#`symbol$();sym:`g#`symbol$();val:`float$())

/ char_type is shurtcut for datatypes.
weather:([]timestamp:"p"$();latitude:"e"$();longitude:"e"$();temperature:"e"$())