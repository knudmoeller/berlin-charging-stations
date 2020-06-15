#! /usr/bin/env ruby

require 'csv'
require 'nokogiri'

if ARGV.length == 2

    gml_in_path = ARGV[0]
    csv_out_path = ARGV[1]

    doc = File.open(gml_in_path) { |f| Nokogiri::XML(f) }
    doc.remove_namespaces!

    CSV.open(csv_out_path, "wb") do |csv|
        keys = ['id', 'quelle', 'betreiber', 'ladeeinr_art', 'plz_ort', 'adresse', 'ladeart', 'bemerkungen', 'anschlussltg_kw', 'steckertyp_1', 'p1_kw', 'steckertyp_2', 'p2_kw', 'steckertyp_3', 'p3_kw', 'steckertyp_4', 'p4_kw', 'inbetrieb_am', 'x_wert', 'y_wert' ] 
        csv << keys
        doc.css("member L210").each do |charging_station|
            station_csv = []
            keys.each do |key|
                station_csv << charging_station.at_css(key).content
            end
            csv << station_csv
        end
    end
else
    puts "usage: ruby #{File.basename(__FILE__)} GML_IN.xml CSV_OUT.csv"
end