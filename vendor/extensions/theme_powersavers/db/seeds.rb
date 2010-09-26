# Use this file to load your own seed data from extensions.  
# See the db/seeds.rb file in the Spree core for some ideas on what you can do here.

#Rake::Task["db:load_dir"].invoke( "default" )
#puts "Default data has been loaded"
#[
#  {:name => 'South Australia', :abbr => 'SA', :country_id => 12},
#  {:name => 'Wetsern Australia', :abbr => 'WA', :country_id => 12},
#  {:name => 'Victoria', :abbr => 'VIC', :country_id => 12},
#  {:name => 'Queensland', :abbr => 'QLD', :country_id => 12},
#  {:name => 'Tasmania', :abbr => 'TAS', :country_id => 12},
#  {:name => 'Australian Capital Territory', :abbr => 'ACT', :country_id => 12},
#  {:name => 'New South Wales', :abbr => 'NSW', :country_id => 12},
#  {:name => 'Northern Territory', :abbr => 'NT', :country_id => 12}
#
#].each do |state|
#  State.create(state)
#end
#
#zones = Zone.create(
#  {:id => 3, :name => 'Australia', :description => 'Australia'}
#)
#
#zone_members = ZoneMember.create(
#  {:zone_id => 3, :zoneable_id => 12, :zoneable_type => 'country'}
#)
#p = Product.create :name => "some product",  :description => "some text here"
#product = Product.create(
#  {
#   :name => 'Single Phase Unit PPS-60',
#   :price => 1000.0,
#   :cost_price => 500,
#   :sku => "SH-00001",
#   :available_on => Time.now,
#   :description => "<h2>Product<br />
#    Single Phase Unit PPS-60</h2>
#    <p><strong>Optimise energy usage every minute of every day...</strong></p>
#    <p>Energy efficiencies on inductive loads for all typrake es of motorised equipment such as Household Appliances, Entertainment Systems, Airconditioners, Irrigation Systems, Compressors, Electric Tools, Swimming Pools &amp; Spas and Pumps.</p>
#        <ul>
#            <li>Protects against Spikes, Surges &amp; Lightning</li>
#            <li>Extends the working life of Motors, Equipment &amp; Appliances</li>
#            <li>Protects sensitive office &amp; entertainment equipment</li>
#            <li>Prolongs equipment life by lowering motor temperatures</li>
#            <li>Reduces line noise &amp; harmful harmonics</li>
#            <li>Minimises pixellation on digital TVs</li>
#            <li>Reduces EMF Radiation</li>
#        <li>Compatible with Generators, Solar Panels, Wind Turbines &amp; Smart Meters</li>
#            <li>Professional Power Saver has a 20 year life expectancy</li>
#            <li>Built on solid Physics &amp; Electrical Engineering principles</li>
#            <li>Strong metal casing</li>
#            <li>Quality components</li>
#            <li>Independently tested and certified to international standards</li>
#        </ul>",
#    :permalink => "single-phase-unit-pps-60"
#  }
#)

#img = Image.create(:attachment => File.open(File.join(RAILS_ROOT, 'public/images/unit.jpg')), :viewable => product)

#taxon = Taxon.create([{}])
#
#product_taxons = ProductTaxon.create([{:product_id => 1, :taxon_id => 1}])