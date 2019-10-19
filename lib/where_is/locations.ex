defmodule WhereIs.Locations do
  defstruct name: "", attributes: %{}, children: [], x: 0, y: 0, asset: "", transform: %{}, asset_type: :desk

  def find_location([%{name: name} = location | _tail] = locations, name) when is_binary(name) do
    location
  end

  def find_location([%{} | tail] = locations, name) when is_binary(name) do
    find_location(tail, name)
  end

  def find_location([], _name) do
    nil
  end


  def list do
    [
      %__MODULE__{ name: "Desk 1",   transform: %{ x: "7",      y: "114",    rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 2",   transform: %{ x: "25.15",  y: "103.5",  rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 3",   transform: %{ x: "40.75",  y: "103.5",  rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 4",   transform: %{ x: "58.95",  y: "114",    rotate: "270 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 5",   transform: %{ x: "40.75",  y: "124.5",  rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 6",   transform: %{ x: "25.15",  y: "124.5",  rotate: "330 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 7",   transform: %{ x: "7",      y: "164",    rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 8",   transform: %{ x: "25.15",  y: "153.5",  rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 9",   transform: %{ x: "40.75",  y: "153.5",  rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 10",  transform: %{ x: "58.95",  y: "164",    rotate: "270 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 11",  transform: %{ x: "40.75",  y: "174.5",  rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 12",  transform: %{ x: "25.15",  y: "174.5",  rotate: "330 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 13",  transform: %{ x: "7",      y: "214",    rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 14",  transform: %{ x: "25.15",  y: "203.5",  rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 15",  transform: %{ x: "40.75",  y: "203.5",  rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 16",  transform: %{ x: "58.95",  y: "214",    rotate: "270 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 17",  transform: %{ x: "40.75",  y: "224.5",  rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 18",  transform: %{ x: "25.15",  y: "224.5",  rotate: "330 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 19",  transform: %{ x: "7",      y: "264",    rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 20",  transform: %{ x: "25.15",  y: "253.5",  rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 21",  transform: %{ x: "40.75",  y: "253.5",  rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 22",  transform: %{ x: "58.95",  y: "264",    rotate: "270 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 23",  transform: %{ x: "40.75",  y: "274.5",  rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 24",  transform: %{ x: "25.15",  y: "274.5",  rotate: "330 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 25",  transform: %{ x: "7",      y: "314",    rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 26",  transform: %{ x: "25.15",  y: "303.5",  rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 27",  transform: %{ x: "40.75",  y: "303.5",  rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 28",  transform: %{ x: "58.95",  y: "314",    rotate: "270 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 29",  transform: %{ x: "40.75",  y: "324.5",  rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 30",  transform: %{ x: "25.15",  y: "324.5",  rotate: "330 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 31",  transform: %{ x: "7",      y: "364",    rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 32",  transform: %{ x: "25.15",  y: "353.5",  rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 33",  transform: %{ x: "40.75",  y: "353.5",  rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 34",  transform: %{ x: "58.95",  y: "364",    rotate: "270 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 35",  transform: %{ x: "40.75",  y: "374.5",  rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 36",  transform: %{ x: "25.15",  y: "374.5",  rotate: "330 12 12" }, asset_type: :desk },

      # Desks north building north section middle row starting fron the north going south
      %__MODULE__{ name: "Desk 37",  transform: %{ x: "82",     y: "64",     rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 38",  transform: %{ x: "100.15", y: "53.5",   rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 39",  transform: %{ x: "115.75", y: "53.5",   rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 40",  transform: %{ x: "133.95", y: "64",     rotate: "270 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 41",  transform: %{ x: "115.75", y: "74.5",   rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 42",  transform: %{ x: "100.15", y: "74.5",   rotate: "330 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 43",  transform: %{ x: "82",     y: "124",    rotate: "60 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 44",  transform: %{ x: "92.65",  y: "105.7",  rotate: "180 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 45",  transform: %{ x: "106.25", y: "97.7",   rotate: "120 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 46",  transform: %{ x: "127.5",  y: "97.7",   rotate: "240 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 47",  transform: %{ x: "116.95", y: "116",    rotate: "0 12 12"   }, asset_type: :desk },
      %__MODULE__{ name: "Desk 48",  transform: %{ x: "103.15", y: "124",    rotate: "300 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 49",  transform: %{ x: "82.1",   y: "145.3",  rotate: "120 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 50",  transform: %{ x: "103.25", y: "145.3",  rotate: "240 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 51",  transform: %{ x: "116.85", y: "153.2",  rotate: "180 12 12" }, asset_type: :desk},
      %__MODULE__{ name: "Desk 52",  transform: %{ x: "127.45", y: "171.5",  rotate: "300 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 53",  transform: %{ x: "106.25", y: "171.5",  rotate: "60 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 54",  transform: %{ x: "92.65",  y: "163.6",  rotate: "360 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 55",  transform: %{ x: "82",     y: "214",    rotate: "60 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 56",  transform: %{ x: "92.65",  y: "195.7",  rotate: "180 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 57",  transform: %{ x: "106.25", y: "187.7",  rotate: "120 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 58",  transform: %{ x: "127.5",  y: "187.7",  rotate: "240 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 59",  transform: %{ x: "116.95", y: "206",    rotate: "0 12 12"   }, asset_type: :desk },
      %__MODULE__{ name: "Desk 60",  transform: %{ x: "103.15", y: "214",    rotate: "300 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 61",  transform: %{ x: "82.1",   y: "245.3",  rotate: "120 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 62",  transform: %{ x: "103.25", y: "245.3",  rotate: "240 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 63",  transform: %{ x: "116.85", y: "253.2",  rotate: "180 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 64",  transform: %{ x: "127.45", y: "271.5",  rotate: "300 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 65",  transform: %{ x: "106.25", y: "271.5",  rotate: "60 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 66",  transform: %{ x: "92.65",  y: "263.6",  rotate: "360 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 67",  transform: %{ x: "82",     y: "314",    rotate: "60 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 68",  transform: %{ x: "92.65",  y: "295.7",  rotate: "180 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 69",  transform: %{ x: "106.25", y: "287.7",  rotate: "120 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 70",  transform: %{ x: "127.5",  y: "287.7",  rotate: "240 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 71",  transform: %{ x: "116.95", y: "306",    rotate: "0 12 12"   }, asset_type: :desk },
      %__MODULE__{ name: "Desk 72",  transform: %{ x: "103.15", y: "314",    rotate: "300 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 73",  transform: %{ x: "82.1",   y: "345.3",  rotate: "120 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 74",  transform: %{ x: "103.25", y: "345.3",  rotate: "240 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 75",  transform: %{ x: "116.85", y: "353.2",  rotate: "180 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 76",  transform: %{ x: "127.45", y: "371.5",  rotate: "300 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 77",  transform: %{ x: "106.25", y: "371.5",  rotate: "60 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 78",  transform: %{ x: "92.65",  y: "363.6",  rotate: "360 12 12" }, asset_type: :desk },

      # Desks north building north section east row starting fron the north going south
      %__MODULE__{ name: "Desk 79",  transform: %{ x: "157",    y: "64",     rotate: "90 12 12"  }, asset_type: :desk},
      %__MODULE__{ name: "Desk 80",  transform: %{ x: "175.15", y: "53.5",   rotate: "210 12 12" }, asset_type: :desk},
      %__MODULE__{ name: "Desk 81",  transform: %{ x: "190.75", y: "53.5",   rotate: "150 12 12" }, asset_type: :desk},
      %__MODULE__{ name: "Desk 82",  transform: %{ x: "208.95", y: "64",     rotate: "270 12 12" }, asset_type: :desk},
      %__MODULE__{ name: "Desk 83",  transform: %{ x: "190.75", y: "74.5",   rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 84",  transform: %{ x: "175.15", y: "74.5",   rotate: "330 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 85",  transform: %{ x: "157",    y: "114",    rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 86",  transform: %{ x: "175.15", y: "103.5",  rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 87",  transform: %{ x: "190.75", y: "103.5",  rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 88",  transform: %{ x: "208.95", y: "114",    rotate: "270 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 89",  transform: %{ x: "190.75", y: "124.5",  rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 90",  transform: %{ x: "175.15", y: "124.5",  rotate: "330 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 91",  transform: %{ x: "157",    y: "164",    rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 92",  transform: %{ x: "175.15", y: "153.5",  rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 93",  transform: %{ x: "190.75", y: "153.5",  rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 94",  transform: %{ x: "208.95", y: "164",    rotate: "270 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 95",  transform: %{ x: "190.75", y: "174.5",  rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 96",  transform: %{ x: "175.15", y: "174.5",  rotate: "330 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 97",  transform: %{ x: "157",    y: "214",    rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 98",  transform: %{ x: "175.15", y: "203.5",  rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 99",  transform: %{ x: "190.75", y: "203.5",  rotate: "150 12 12" }, asset_type: :desk},
      %__MODULE__{ name: "Desk 100", transform: %{ x: "208.95", y: "214",    rotate: "270 12 12" }, asset_type: :desk},
      %__MODULE__{ name: "Desk 101", transform: %{ x: "190.75", y: "224.5",  rotate: "30 12 12"  }, asset_type: :desk},
      %__MODULE__{ name: "Desk 102", transform: %{ x: "175.15", y: "224.5",  rotate: "330 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 103", transform: %{ x: "157",    y: "264",    rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 104", transform: %{ x: "175.15", y: "253.5",  rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 105", transform: %{ x: "190.75", y: "253.5",  rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 106", transform: %{ x: "208.95", y: "264",    rotate: "270 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 107", transform: %{ x: "190.75", y: "274.5",  rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 108", transform: %{ x: "175.15", y: "274.5",  rotate: "330 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 109", transform: %{ x: "157",    y: "314",    rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 110", transform: %{ x: "175.15", y: "303.5",  rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 111", transform: %{ x: "190.75", y: "303.5",  rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 112", transform: %{ x: "208.95", y: "314",    rotate: "270 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 113", transform: %{ x: "190.75", y: "324.5",  rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 114", transform: %{ x: "175.15", y: "324.5",  rotate: "330 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 115", transform: %{ x: "157",    y: "364",    rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 116", transform: %{ x: "175.15", y: "353.5",  rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 117", transform: %{ x: "190.75", y: "353.5",  rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 118", transform: %{ x: "208.95", y: "364",    rotate: "270 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 119", transform: %{ x: "190.75", y: "374.5",  rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 120", transform: %{ x: "175.15", y: "374.5",  rotate: "330 12 12" }, asset_type: :desk },

      # Desks north building middle section west row starting fron the north going south
      %__MODULE__{ name: "Desk 122", transform: %{ x: "12",     y: "533.9",  rotate: "150 12 12" }, asset_type: :desk},
      %__MODULE__{ name: "Desk 123", transform: %{ x: "19.84",  y: "520.3",  rotate: "90 12 12"  }, asset_type: :desk},
      %__MODULE__{ name: "Desk 124", transform: %{ x: "38.1",   y: "509.7",  rotate: "210 12 12" }, asset_type: :desk},
      %__MODULE__{ name: "Desk 125", transform: %{ x: "38.1",   y: "530.9",  rotate: "-30 12 12" }, asset_type: :desk},
      %__MODULE__{ name: "Desk 126", transform: %{ x: "30.2",   y: "544.45", rotate: "270 12 12" }, asset_type: :desk},
      %__MODULE__{ name: "Desk 127", transform: %{ x: "12",     y: "620",    rotate: "30 12 12"  }, asset_type: :desk},
      %__MODULE__{ name: "Desk 128", transform: %{ x: "12",     y: "598.9",  rotate: "150 12 12" }, asset_type: :desk},
      %__MODULE__{ name: "Desk 129", transform: %{ x: "19.84",  y: "585.3",  rotate: "90 12 12"  }, asset_type: :desk},
      %__MODULE__{ name: "Desk 130", transform: %{ x: "38.1",   y: "574.7",  rotate: "210 12 12" }, asset_type: :desk},
      %__MODULE__{ name: "Desk 131", transform: %{ x: "38.1",   y: "595.9",  rotate: "-30 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 132", transform: %{ x: "30.2",   y: "609.45", rotate: "270 12 12" }, asset_type: :desk },

      # Desks north building middle section middle row starting fron the north going south
      %__MODULE__{ name: "Desk 133", transform: %{ x: "72",     y: "555",    rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 134", transform: %{ x: "72",     y: "533.9",  rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 135", transform: %{ x: "79.84",  y: "520.3",  rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 136", transform: %{ x: "98.1",   y: "509.7",  rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 137", transform: %{ x: "98.1",   y: "530.9",  rotate: "-30 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 138", transform: %{ x: "90.2",   y: "544.45", rotate: "270 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 139", transform: %{ x: "72",     y: "620",    rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 140", transform: %{ x: "72",     y: "598.9",  rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 141", transform: %{ x: "79.84",  y: "585.3",  rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 142", transform: %{ x: "98.1",   y: "574.7",  rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 143", transform: %{ x: "98.1",   y: "595.9",  rotate: "-30 12 12" }, asset_type: :desk},
      %__MODULE__{ name: "Desk 144", transform: %{ x: "90.2",   y: "609.45", rotate: "270 12 12" }, asset_type: :desk},

      # Desks north building middle section east row starting fron the north going south
      %__MODULE__{ name: "Desk 145", transform: %{ x: "117",    y: "514",    rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 146", transform: %{ x: "135.15", y: "503.5",  rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 147", transform: %{ x: "150.75", y: "503.5",  rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 148", transform: %{ x: "168.95", y: "514",    rotate: "270 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 149", transform: %{ x: "150.75", y: "524.5",  rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 150", transform: %{ x: "135.15", y: "524.5",  rotate: "330 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 151", transform: %{ x: "117",    y: "564",    rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 152", transform: %{ x: "135.15", y: "553.5",  rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 153", transform: %{ x: "150.75", y: "553.5",  rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 154", transform: %{ x: "168.95", y: "564",    rotate: "270 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 155", transform: %{ x: "150.75", y: "574.5",  rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 156", transform: %{ x: "135.15", y: "574.5",  rotate: "330 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 157", transform: %{ x: "117",    y: "614",    rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 158", transform: %{ x: "135.15", y: "603.5",  rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 159", transform: %{ x: "150.75", y: "603.5",  rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 160", transform: %{ x: "168.95", y: "614",    rotate: "270 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 161", transform: %{ x: "150.75", y: "624.5",  rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 162", transform: %{ x: "135.15", y: "624.5",  rotate: "330 12 12" }, asset_type: :desk },

      # North building south section west row
      %__MODULE__{ name: "Desk 163", transform: %{ x: "7",      y: "1013",   rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 164", transform: %{ x: "25.15",  y: "1002.5", rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 165", transform: %{ x: "40.75",  y: "1002.5", rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 166", transform: %{ x: "58.95",  y: "1013",   rotate: "270 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 167", transform: %{ x: "40.75",  y: "1023.5", rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 168", transform: %{ x: "25.15",  y: "1023.5", rotate: "330 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 169", transform: %{ x: "7",      y: "1053",   rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 170", transform: %{ x: "25.15",  y: "1042.5", rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 171", transform: %{ x: "40.75",  y: "1042.5", rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 172", transform: %{ x: "58.95",  y: "1053",   rotate: "270 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 173", transform: %{ x: "40.75",  y: "1063.5", rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 174", transform: %{ x: "25.15",  y: "1063.5", rotate: "330 12 12" }, asset_type: :desk },

      # North building south section first middle row
      %__MODULE__{ name: "Desk 175", transform: %{ x: "90.2",   y: "1000",   rotate: "0 12 12"   }, asset_type: :desk },
      %__MODULE__{ name: "Desk 176", transform: %{ x: "79.6",   y: "981.8",  rotate: "120 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 177", transform: %{ x: "79.6",   y: "966",    rotate: "60 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 178", transform: %{ x: "90.2",   y: "947.7",  rotate: "180 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 179", transform: %{ x: "100.6",  y: "966",    rotate: "-60 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 180", transform: %{ x: "100.6",  y: "981.8",  rotate: "240 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 181", transform: %{ x: "90.2",   y: "1075",   rotate: "0 12 12"   }, asset_type: :desk },
      %__MODULE__{ name: "Desk 182", transform: %{ x: "79.6",   y: "1056.8", rotate: "120 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 183", transform: %{ x: "79.6",   y: "1041",   rotate: "60 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 184", transform: %{ x: "90.2",   y: "1022.7", rotate: "180 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 185", transform: %{ x: "100.6",  y: "1041",   rotate: "-60 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 186", transform: %{ x: "100.6",  y: "1056.8", rotate: "240 12 12" }, asset_type: :desk },

      # North building south section second middle row
      %__MODULE__{ name: "Desk 187", transform: %{ x: "135.2",  y: "1000",   rotate: "0 12 12"   }, asset_type: :desk },
      %__MODULE__{ name: "Desk 188", transform: %{ x: "124.6",  y: "981.8",  rotate: "120 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 189", transform: %{ x: "124.6",  y: "966",    rotate: "60 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 190", transform: %{ x: "135.2",  y: "947.7",  rotate: "180 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 191", transform: %{ x: "145.6",  y: "966",    rotate: "-60 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 192", transform: %{ x: "145.6",  y: "981.8",  rotate: "240 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 193", transform: %{ x: "135.2",  y: "1075",   rotate: "0 12 12"   }, asset_type: :desk },
      %__MODULE__{ name: "Desk 194", transform: %{ x: "124.6",  y: "1056.8", rotate: "120 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 195", transform: %{ x: "124.6",  y: "1041",   rotate: "60 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 196", transform: %{ x: "135.2",  y: "1022.7", rotate: "180 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 197", transform: %{ x: "145.6",  y: "1041",   rotate: "-60 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 198", transform: %{ x: "145.6",  y: "1056.8", rotate: "240 12 12" }, asset_type: :desk },

      # North building south section east row
      %__MODULE__{ name: "Desk 199", transform: %{ x: "162",    y: "843",    rotate: "60 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 200", transform: %{ x: "172.65", y: "824.7",  rotate: "180 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 201", transform: %{ x: "186.25", y: "816.7",  rotate: "120 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 202", transform: %{ x: "207.5",  y: "816.7",  rotate: "240 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 203", transform: %{ x: "196.95", y: "835",    rotate: "0 12 12"   }, asset_type: :desk },
      %__MODULE__{ name: "Desk 204", transform: %{ x: "183.15", y: "843",    rotate: "300 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 205", transform: %{ x: "162",    y: "888",    rotate: "60 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 206", transform: %{ x: "172.65", y: "869.7",  rotate: "180 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 207", transform: %{ x: "186.25", y: "861.7",  rotate: "120 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 208", transform: %{ x: "207.5",  y: "861.7",  rotate: "240 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 209", transform: %{ x: "196.95", y: "880",    rotate: "0 12 12"   }, asset_type: :desk },
      %__MODULE__{ name: "Desk 210", transform: %{ x: "183.15", y: "888",    rotate: "300 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 211", transform: %{ x: "162",    y: "933",    rotate: "60 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 212", transform: %{ x: "172.65", y: "914.7",  rotate: "180 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 213", transform: %{ x: "186.25", y: "906.7",  rotate: "120 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 214", transform: %{ x: "207.5",  y: "906.7",  rotate: "240 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 215", transform: %{ x: "196.95", y: "925",    rotate: "0 12 12"   }, asset_type: :desk },
      %__MODULE__{ name: "Desk 216", transform: %{ x: "183.15", y: "933",    rotate: "300 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 217", transform: %{ x: "162",    y: "978",    rotate: "60 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 218", transform: %{ x: "172.65", y: "959.7",  rotate: "180 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 219", transform: %{ x: "186.25", y: "951.7",  rotate: "120 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 220", transform: %{ x: "207.5",  y: "951.7",  rotate: "240 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 221", transform: %{ x: "196.95", y: "970",    rotate: "0 12 12"   }, asset_type: :desk },
      %__MODULE__{ name: "Desk 222", transform: %{ x: "183.15", y: "978",    rotate: "300 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 223", transform: %{ x: "162",    y: "1023",   rotate: "60 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 224", transform: %{ x: "172.65", y: "1004.7",  rotate: "180 12 12"}, asset_type: :desk },
      %__MODULE__{ name: "Desk 225", transform: %{ x: "186.25", y: "996.7",  rotate: "120 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 226", transform: %{ x: "207.5",  y: "996.7",  rotate: "240 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 227", transform: %{ x: "196.95", y: "1015",   rotate: "0 12 12"   }, asset_type: :desk },
      %__MODULE__{ name: "Desk 228", transform: %{ x: "183.15", y: "1023",   rotate: "300 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 229", transform: %{ x: "162",    y: "1068",   rotate: "60 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 230", transform: %{ x: "172.65", y: "1049.7", rotate: "180 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 231", transform: %{ x: "186.25", y: "1041.7", rotate: "120 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 232", transform: %{ x: "207.5",  y: "1041.7", rotate: "240 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 233", transform: %{ x: "196.95", y: "1060",   rotate: "0 12 12"   }, asset_type: :desk },
      %__MODULE__{ name: "Desk 234", transform: %{ x: "183.15", y: "1068",   rotate: "300 12 12" }, asset_type: :desk },

      # South Building
      %__MODULE__{ name: "Desk 1",    transform: %{ x: "847",     y: "84",    rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 2",    transform: %{ x: "865.15",  y: "73.5",  rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 3",    transform: %{ x: "880.75",  y: "73.5",  rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 4",    transform: %{ x: "898.95",  y: "84",    rotate: "270 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 5",    transform: %{ x: "880.75",  y: "94.5",  rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 6",    transform: %{ x: "865.15",  y: "94.5",  rotate: "330 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 7",    transform: %{ x: "847",     y: "124",    rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 8",    transform: %{ x: "865.15",  y: "113.5",  rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 9",    transform: %{ x: "880.75",  y: "113.5",  rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 10",   transform: %{ x: "898.95",  y: "124",    rotate: "270 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 11",   transform: %{ x: "880.75",  y: "134.5",  rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 12",   transform: %{ x: "865.15",  y: "134.5",  rotate: "330 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 13",   transform: %{ x: "830.6",   y: "161",    rotate: "-60 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 14",   transform: %{ x: "820.2",   y: "142.7",  rotate: "180 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 15",   transform: %{ x: "809.6",   y: "161",    rotate: "60 12 12"  }, asset_type: :desk },

      %__MODULE__{ name: "Desk 16",   transform: %{ x: "840.2",   y: "228",    rotate: "0 12 12"   }, asset_type: :desk },
      %__MODULE__{ name: "Desk 17",   transform: %{ x: "829.6",   y: "209.8",  rotate: "120 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 18",   transform: %{ x: "829.6",   y: "194",    rotate: "60 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 19",   transform: %{ x: "840.2",   y: "175.7",  rotate: "180 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 20",   transform: %{ x: "850.6",   y: "194",    rotate: "-60 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 21",   transform: %{ x: "850.6",   y: "209.8",  rotate: "240 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 22",   transform: %{ x: "880.2",   y: "213",   rotate: "0 12 12"   }, asset_type: :desk },
      %__MODULE__{ name: "Desk 23",   transform: %{ x: "869.6",   y: "194.8", rotate: "120 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 24",   transform: %{ x: "869.6",   y: "179",   rotate: "60 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 25",   transform: %{ x: "880.2",   y: "160.7", rotate: "180 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 26",   transform: %{ x: "890.6",   y: "179",   rotate: "-60 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 27",   transform: %{ x: "890.6",   y: "194.8", rotate: "240 12 12" }, asset_type: :desk },

      #desks south building section north east, starting from the north going south
      %__MODULE__{ name: "Desk 28",   transform: %{ x: "359",     y: "74",    rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 29",   transform: %{ x: "377.15",  y: "63.5",  rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 30",   transform: %{ x: "392.75",  y: "63.5",  rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 31",   transform: %{ x: "410.95",  y: "74",    rotate: "270 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 32",   transform: %{ x: "392.75",  y: "84.5",  rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 33",   transform: %{ x: "377.15",  y: "84.5",  rotate: "330 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 34",   transform: %{ x: "424",     y: "74",    rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 35",   transform: %{ x: "442.15",  y: "63.5",  rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 36",   transform: %{ x: "457.75",  y: "63.5",  rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 37",   transform: %{ x: "475.95",  y: "74",    rotate: "270 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 38",   transform: %{ x: "457.75",  y: "84.5",  rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 39",   transform: %{ x: "442.15",  y: "84.5",  rotate: "330 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 40",   transform: %{ x: "404",     y: "114",    rotate: "90 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 41",   transform: %{ x: "422.15",  y: "103.5",  rotate: "210 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 42",   transform: %{ x: "437.75",  y: "103.5",  rotate: "150 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 43",   transform: %{ x: "455.95",  y: "114",    rotate: "270 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 44",   transform: %{ x: "437.75",  y: "124.5",  rotate: "30 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 45",   transform: %{ x: "422.15",  y: "124.5",  rotate: "330 12 12" }, asset_type: :desk },

      #desks south building section north east on diag, starting from the main entrance going south
      %__MODULE__{ name: "Desk 46",   transform: %{ x: "353.81", y: "132.1",   rotate: "110 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 47",   transform: %{ x: "374.6",  y: "128.5",   rotate: "230 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 48",   transform: %{ x: "389.3",  y: "133.9",   rotate: "170 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 49",   transform: %{ x: "402.95", y: "150",     rotate: "290 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 50",   transform: %{ x: "382.1",  y: "153.7",   rotate: "50 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 51",   transform: %{ x: "367.3",  y: "148.3",   rotate: "350 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 52",   transform: %{ x: "289.64", y: "141.97",  rotate: "100 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 53",   transform: %{ x: "309.4",  y: "134.8",   rotate: "220 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 54",   transform: %{ x: "324.8",  y: "137.5",   rotate: "160 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 55",   transform: %{ x: "340.95", y: "151",     rotate: "280 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 56",   transform: %{ x: "321.1",  y: "158.2",   rotate: "40 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 57",   transform: %{ x: "305.7",  y: "155.5",   rotate: "340 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 58",   transform: %{ x: "331.64", y: "180.97",   rotate: "100 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 59",   transform: %{ x: "351.4",  y: "173.8",   rotate: "220 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 60",   transform: %{ x: "366.8",  y: "176.5",   rotate: "160 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 61",   transform: %{ x: "382.95", y: "190",     rotate: "280 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 62",   transform: %{ x: "363.1",  y: "197.2",   rotate: "40 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 63",   transform: %{ x: "347.7",  y: "194.5",   rotate: "340 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 64",   transform: %{ x: "265.64", y: "187.97",  rotate: "100 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 65",   transform: %{ x: "285.4",  y: "180.8",   rotate: "220 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 66",   transform: %{ x: "300.8",  y: "183.5",   rotate: "160 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 67",   transform: %{ x: "316.95", y: "197",     rotate: "280 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 68",   transform: %{ x: "297.1",  y: "204.2",   rotate: "40 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 69",   transform: %{ x: "281.7",  y: "201.5",   rotate: "340 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 70",   transform: %{ x: "312.64", y: "225.97",  rotate: "100 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 71",   transform: %{ x: "332.4",  y: "218.8",   rotate: "220 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 72",   transform: %{ x: "347.8",  y: "221.5",   rotate: "160 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 73",   transform: %{ x: "363.95", y: "235",     rotate: "280 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 74",   transform: %{ x: "344.1",  y: "242.2",   rotate: "40 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 75",   transform: %{ x: "328.7",  y: "239.5",   rotate: "340 12 12" }, asset_type: :desk },

      #area to the east of the server room and south of the kitchen, starting at the north by the kitchen and going south
      %__MODULE__{ name: "Desk 76",   transform: %{ x: "362.7",   y: "347.2",  rotate: "25 12 12"   }, asset_type: :desk },
      %__MODULE__{ name: "Desk 77",   transform: %{ x: "360.9",   y: "326.0",  rotate: "145 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 78",   transform: %{ x: "367.6",   y: "311.5",  rotate: "85 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 79",   transform: %{ x: "385.0",   y: "299.4",  rotate: "205 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 80",   transform: %{ x: "386.8",   y: "320.6",  rotate: "-35 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 81",   transform: %{ x: "380.1",   y: "335.1",  rotate: "265 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 82",   transform: %{ x: "321.6",   y: "340",    rotate: "-60 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 83",   transform: %{ x: "311.2",   y: "321.7",  rotate: "180 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 84",   transform: %{ x: "300.6",   y: "340",    rotate: "60 12 12"  }, asset_type: :desk },

      %__MODULE__{ name: "Desk 85",   transform: %{ x: "336.7",   y: "408.2",  rotate: "25 12 12"   }, asset_type: :desk },
      %__MODULE__{ name: "Desk 86",   transform: %{ x: "334.9",   y: "387.0",  rotate: "145 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 87",   transform: %{ x: "341.6",   y: "372.5",  rotate: "85 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 88",   transform: %{ x: "359.0",   y: "360.4",  rotate: "205 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 89",   transform: %{ x: "360.8",   y: "381.6",  rotate: "-35 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 90",   transform: %{ x: "354.1",   y: "396.1",  rotate: "265 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 91",   transform: %{ x: "306.6",   y: "380",    rotate: "-60 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 92",   transform: %{ x: "296.2",   y: "361.7",  rotate: "180 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 93",   transform: %{ x: "285.6",   y: "380",    rotate: "60 12 12"  }, asset_type: :desk },

      # southern most area, starting at the north by the door and going south
      %__MODULE__{ name: "Desk 94",   transform: %{ x: "91.2",   y: "500",    rotate: "20 12 12"   }, asset_type: :desk },
      %__MODULE__{ name: "Desk 95",   transform: %{ x: "87.5",   y: "479.2",  rotate: "140 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 96",   transform: %{ x: "92.9",   y: "464.5",  rotate: "80 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 97",   transform: %{ x: "109.1",  y: "450.9",  rotate: "200 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 98",   transform: %{ x: "112.8",  y: "471.6",  rotate: "-40 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 99",   transform: %{ x: "107.4",  y: "486.4",  rotate: "260 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 100",   transform: %{ x: "133.81", y: "486.1",  rotate: "110 12 12", }, asset_type: :desk },
      %__MODULE__{ name: "Desk 101",   transform: %{ x: "154.6",  y: "482.5",  rotate: "230 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 102",   transform: %{ x: "169.3",  y: "487.9",  rotate: "170 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 103",   transform: %{ x: "182.95", y: "504",    rotate: "290 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 104",   transform: %{ x: "162.1",  y: "507.7",  rotate: "50 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 105",   transform: %{ x: "147.3",  y: "502.3",  rotate: "350 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 106",   transform: %{ x: "199.1",  y: "533.12", rotate: "80 12 12", }, asset_type: :desk },
      %__MODULE__{ name: "Desk 107",   transform: %{ x: "215.3",  y: "519.4",  rotate: "200 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 108",   transform: %{ x: "231",    y: "516.7",  rotate: "140 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 109",   transform: %{ x: "250.95", y: "524",    rotate: "260 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 110",   transform: %{ x: "234.76", y: "537.6",  rotate: "20 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 111",   transform: %{ x: "219.0",  y: "540.4",  rotate: "320 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 112",   transform: %{ x: "118.81", y: "522.1",  rotate: "110 12 12", }, asset_type: :desk },
      %__MODULE__{ name: "Desk 113",   transform: %{ x: "139.6",  y: "518.5",  rotate: "230 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 114",   transform: %{ x: "154.3",  y: "523.9",  rotate: "170 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 115",   transform: %{ x: "167.95", y: "540",    rotate: "290 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 116",   transform: %{ x: "147.1",  y: "543.7",  rotate: "50 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 117",   transform: %{ x: "132.3",  y: "538.3",  rotate: "350 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 118",   transform: %{ x: "65.2",   y: "565",    rotate: "20 12 12"   }, asset_type: :desk },
      %__MODULE__{ name: "Desk 119",   transform: %{ x: "61.5",   y: "544.2",  rotate: "140 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 120",   transform: %{ x: "66.9",   y: "529.5",  rotate: "80 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 121",   transform: %{ x: "83.1",   y: "515.9",  rotate: "200 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 122",   transform: %{ x: "86.8",   y: "536.6",  rotate: "-40 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 123",   transform: %{ x: "81.4",   y: "551.4",  rotate: "260 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 124",   transform: %{ x: "102.81", y: "557.1",  rotate: "110 12 12", }, asset_type: :desk },
      %__MODULE__{ name: "Desk 125",   transform: %{ x: "123.6",  y: "553.5",  rotate: "230 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 126",   transform: %{ x: "138.3",  y: "558.9",  rotate: "170 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 127",   transform: %{ x: "151.95", y: "575",    rotate: "290 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 128",   transform: %{ x: "131.1",  y: "578.7",  rotate: "50 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 129",   transform: %{ x: "116.3",  y: "573.3",  rotate: "350 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 130",   transform: %{ x: "175.1",  y: "577.12", rotate: "80 12 12", }, asset_type: :desk },
      %__MODULE__{ name: "Desk 131",   transform: %{ x: "191.3",  y: "563.4",  rotate: "200 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 132",   transform: %{ x: "207",    y: "560.7",  rotate: "140 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 133",   transform: %{ x: "226.95", y: "568",    rotate: "260 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 134",   transform: %{ x: "210.76", y: "581.6",  rotate: "20 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 135",   transform: %{ x: "195.0",  y: "584.4",  rotate: "320 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 136",   transform: %{ x: "253.2",  y: "606",    rotate: "20 12 12"   }, asset_type: :desk },
      %__MODULE__{ name: "Desk 137",   transform: %{ x: "249.5",  y: "585.2",  rotate: "140 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 138",   transform: %{ x: "254.9",  y: "570.5",  rotate: "80 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 139",   transform: %{ x: "271.1",  y: "556.9",  rotate: "200 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 140",   transform: %{ x: "274.8",  y: "577.6",  rotate: "-40 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 141",   transform: %{ x: "269.4",  y: "592.4",  rotate: "260 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 142",   transform: %{ x: "87.81",  y: "593.1",  rotate: "110 12 12", }, asset_type: :desk },
      %__MODULE__{ name: "Desk 143",   transform: %{ x: "108.6",  y: "589.5",  rotate: "230 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 144",   transform: %{ x: "123.3",  y: "594.9",  rotate: "170 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 145",   transform: %{ x: "136.95", y: "611",    rotate: "290 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 146",   transform: %{ x: "116.1",  y: "614.7",  rotate: "50 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 147",   transform: %{ x: "101.3",  y: "609.3",  rotate: "350 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 148",   transform: %{ x: "39.2",   y: "629",    rotate: "20 12 12"   }, asset_type: :desk },
      %__MODULE__{ name: "Desk 149",   transform: %{ x: "35.5",   y: "608.2",  rotate: "140 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 150",   transform: %{ x: "40.9",   y: "593.5",  rotate: "80 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 151",   transform: %{ x: "57.1",   y: "579.9",  rotate: "200 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 152",   transform: %{ x: "60.8",   y: "600.6",  rotate: "-40 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 153",   transform: %{ x: "55.4",   y: "615.4",  rotate: "260 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 154",   transform: %{ x: "162.1",  y: "622.12", rotate: "80 12 12", }, asset_type: :desk },
      %__MODULE__{ name: "Desk 155",   transform: %{ x: "178.3",  y: "608.4",  rotate: "200 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 156",   transform: %{ x: "194",    y: "605.7",  rotate: "140 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 157",   transform: %{ x: "213.95", y: "613",    rotate: "260 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 158",   transform: %{ x: "197.76", y: "626.6",  rotate: "20 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 159",   transform: %{ x: "182.0",  y: "629.4",  rotate: "320 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 160",   transform: %{ x: "74.81",  y: "628.1",  rotate: "110 12 12", }, asset_type: :desk },
      %__MODULE__{ name: "Desk 161",   transform: %{ x: "95.6",   y: "624.5",  rotate: "230 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 162",   transform: %{ x: "110.3",  y: "629.9",  rotate: "170 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 163",   transform: %{ x: "123.95", y: "646",    rotate: "290 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 164",   transform: %{ x: "103.1",  y: "649.7",  rotate: "50 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 165",   transform: %{ x: "88.3",   y: "644.3",  rotate: "350 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 166",   transform: %{ x: "222.2",  y: "675",    rotate: "20 12 12"   }, asset_type: :desk },
      %__MODULE__{ name: "Desk 167",   transform: %{ x: "218.5",  y: "654.2",  rotate: "140 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 168",   transform: %{ x: "223.9",  y: "639.5",  rotate: "80 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 169",   transform: %{ x: "240.1",  y: "625.9",  rotate: "200 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 170",   transform: %{ x: "243.8",  y: "646.6",  rotate: "-40 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 171",   transform: %{ x: "238.4",  y: "661.4",  rotate: "260 12 12" }, asset_type: :desk },

      %__MODULE__{ name: "Desk 172",   transform: %{ x: "144.1",  y: "667.12", rotate: "80 12 12", }, asset_type: :desk },
      %__MODULE__{ name: "Desk 173",   transform: %{ x: "160.3",  y: "653.4",  rotate: "200 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 174",   transform: %{ x: "176",    y: "650.7",  rotate: "140 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 175",   transform: %{ x: "195.95", y: "658",    rotate: "260 12 12" }, asset_type: :desk },
      %__MODULE__{ name: "Desk 176",   transform: %{ x: "179.76", y: "671.6",  rotate: "20 12 12"  }, asset_type: :desk },
      %__MODULE__{ name: "Desk 177",   transform: %{ x: "164",    y: "674.4",  rotate: "320 12 12" }, asset_type: :desk },
    ]
  end
end
