class HolidayRequest < OpenStruct
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  # Taken from http://pushandpop.blogspot.co.uk/2011/06/activemodel-object-with-multi-part.html
  # There must be a better way of dealing with this. Where does ActiveRecord deal with casting?
  def initialize( attrs = {} )
    # Initialise OpenStruct first, so we can arbitrarily define crap.
    super()
    if !attrs.nil? then
      dattrs = {}
      attrs.each do |n, v|
        if n.match( /^(.+)\(.+\)$/ ) then
          an = Regexp.last_match[1]
          dattrs[an] = [] if dattrs[an].nil?
          dattrs[an] << { :n => n, :v => v }
        else
          send( "#{n}=", v)
        end
      end
      dattrs.each do |k, v|
        vs = v.sort_by{|hv| hv[:n] }.collect{|hv| hv[:v] }
        p1 = vs[0]
        p2 = ( vs[1].size() > 0 ? ( vs[1].size() == 1 ? "0#{vs[1]}" : vs[1] ) : "01" )
        p3 = ( vs[2].size() > 0 ? ( vs[2].size() == 1 ? "0#{vs[2]}" : vs[2] ) : "01" )
        dv = [ p1, p2, p3 ].join( "-" )
        begin send( "#{k}=", Date.parse( dv ) ); rescue; end
      end
    end
  end

  def persisted?
    false
  end
end
