import yaml

bitlane="""
<BitLane MemType="{type}" Placement="{placement}">
  <DataWidth MSB="{msb}" LSB="{lsb}"/>
  <AddressRange Begin="0" End="{end_address}"/>
  <Parity ON="false" NumBits="0"/>
</BitLane>
"""


bram = open("bram.yaml", "r")
doc = yaml.load(bram)

bit_pos   = 0
bit_width = 2
output = ""
for bram  in doc['bram']:
    data = dict()
    # print bram

    data['lsb'] = bit_pos
    data['msb'] = bit_pos + bit_width - 1
    data['end_address'] = 16383
    data['type'] = 'RAMB36E1'
    data['placement'] = bram['SITE']
    bit_pos += bit_width
    output += bitlane.format(**data)

print output
