+++
title = "Home assistant bin collection schedule"
date = "2021-02-21"
+++

Here is how I track my councils bin collection schedule in Home Assistant using the REST sensor.

![Home Assistant bin collection dashboard card](/images/home-assistant-bin-collection.png)

```yaml
# configuration.yaml

sensor:
  - platform: rest
    name: Bin collection
    resource: https://www.southtyneside.gov.uk/apiserver/ajaxlibrary/
    method: POST
    headers:
      Content-Type: application/json
    payload: '{ "jsonrpc": "2.0", "id": "", "method": "wtGetBinCollectionDates", "params": { "addresscode": "S100000351958|XXX SUNDERLAND ROAD, SOUTH SHIELDS, SOUTH TYNESIDE, TYNE AND WEAR, NEXX XXX" } }'
    value_template: '{{ value_json.result.NextHouseholdCollection.FullDateString }}'
    json_attributes:
      - result
  - platform: template
    sensors:
      recycling_bin:
        friendly_name: Recycling bin
        value_template: '{{ states.sensor.bin_collection.attributes["result"]["NextRecyclingCollection"]["FullDateString"] }}'
      black_bin:
        friendly_name: Household bin
        value_template: '{{ states.sensor.bin_collection.attributes["result"]["NextHouseholdCollection"]["FullDateString"] }}'
      green_bin:
        friendly_name: Garden waste
        value_template: '{{ states.sensor.bin_collection.attributes["result"]["NextGardenCollection"]["FullDateString"] }}'
  - platform: template
    sensors:
      this_weeks_bin_collection:
        friendly_name: Bin collection type
        value_template: >-
          {% set recyling_bin_date = strptime(states('sensor.recycling_bin'), '%a %d %B %Y') %}
          {% set black_bin_date = strptime(states('sensor.black_bin'), '%a %d %B %Y') %}
          {% set this_week = now().isocalendar()[1] %}
          {% if this_week == recyling_bin_date.isocalendar()[1] %}
            Blue bin
          {% else %}
            Black bin
          {% endif %}
```

```yaml
# ui-lovelace.yaml

- type: entities
  title: Bin collections
  entities:
    - entity: sensor.this_weeks_bin_collection
      name: Next bin collection type
      icon: mdi:delete
    - entity: sensor.recycling_bin
      name: Recycling bin
      icon: mdi:recycle
    - entity: sensor.black_bin
      name: Black bin
      icon: mdi:delete
    - entity: sensor.green_bin
      name: Garden waste
      icon: mdi:leaf
```

