defmodule WhereIs.Svg do
  alias WhereIs.{Locations, Room}

  def generate_svg do
    {:g, nil, get_defs ++ placements}
    |> XmlBuilder.generate()
  end

  def placements do
    [
      {:use, %{"xlink:href" => "#north-bldg"}, nil},
      {:use, %{"xlink:href" => "#south-bldg", transform: "translate(-900 1300)"}, nil}
    ] ++ locations ++ rooms
  end

  def locations do
    north = Locations.north_desks
            |> Enum.map(&Locations.get_svg_tuple(&1))
    south = Locations.south_desks
            |> Enum.map(&Locations.get_svg_tuple(&1))
    [south | north]
  end

  def rooms do
    WhereIs.Room.get_rooms
            |> Enum.map(&Room.room_to_svg_tuple(&1))
  end

  def get_defs do
    [{:defs, %{}, [desk, north_building, south_building]}]
  end

  def north_building do
    {:g, %{id: "north-bldg"}, [
      {:path, %{
        d: "m232.2 657.5v-55.4h6.8v-0.3c0-0.1-0.2-3.1-2.7-5.3-1.3-1.1-2.9-1.7-4.1-2v-89.6h6.8v-0.3c0-0.1-0.2-3.1-2.7-5.3-1.3-1.1-2.9-1.7-4.1-2 1.2-0.3 2.7-0.8 4.1-2 2.6-2.2 2.7-5.2 2.7-5.3v-0.3h-6.8v-316.9c1.2-0.3 2.7-0.8 4.1-2 2.6-2.2 2.7-5.2 2.7-5.3v-0.3h-6.8v-165.2h-223.6v492.6h-8.6v0.3c0 0.1 0.2 3.1 2.7 5.3 2.2 1.9 5 2.2 5.8 2.2v483.8h-6.8v0.3c0 0.1 0.2 3.1 2.7 5.3 1.3 1.1 2.9 1.7 4.1 2v160.2h223.6v-486.7c1.1-0.1 3.5-0.5 5.4-2.2 2.6-2.2 2.7-5.2 2.7-5.3v-0.3h-8zm-181.6 320.2 3.3 3.1-4.9 6c-0.5-0.5-2-2.3-2-4.9-0.1-2.7 1.4-4.9 1.8-5.6l1.8 1.4zm-4.1 4.2c0.1 3.4 2.3 5.4 2.4 5.5l0.2 0.2 5.2-6.4 1.8 1.7v18.1h-43.5v-29.6h31.1l4.9 4.5c-0.3 0.3-2.2 2.8-2.1 6zm181.7 166h-34.9v-43.2h34.9v43.2zm-36.8 0h-33.5v-43.2h33.5v43.2zm-35.6 0h-34.4v-43.2h34.4v43.2zm-36.4 0h-32.7v-43.2h32.7v43.2zm-34.7 0h-26.6v-43.2h26.6v43.2zm-28.6 0h-43.5v-54.4h29.5l14.1 10.6v43.8zm1.3-45.2-14.7-11.1h-30.1v-88.6h45.5v-20.9l-13.6-12.7h-31.9v-32.8h34.1l11.5-9.5v-282.5h-45.5v-131.1h45.1v-100.4h-45.1v-365.4h215.6v367.2h-34.3v234.7h-121v28.9 63.7 1 1 71.5h72.5 5.8 76.8v287h-170.7zm-44.8-226.8h43.5v50.1l-10.2 8.5h-33.3v-58.6zm43.5-2h-43.5v-60.6h43.5v60.6zm0-62.6h-43.5v-32.7h43.5v32.7zm0-34.6h-43.5v-32.5h43.5v32.5zm0-34.6h-43.5v-29.9h43.5v29.9zm0-31.8h-43.5v-33.7h43.5v33.7zm0-35.7h-43.5v-28h43.5v28zm-43.5-195.8h43.1v32.7h-43.1v-32.7zm43.1-2h-43.1v-28.3h43.1v28.3zm0-30.3h-43.1v-31.4h43.1v31.4zm172.5 367.2h-76.8v-69.5h30.6v-2h-30.6-1-26.4v-63.7h-49v-26.9h118.9 11v21.6h23.3v69h-35v2h35v69.5zm-153.2-69.6h49 2.3v69.5h-51.3v-69.5zm0-63.7h47v61.7h-47v-61.7zm53.3 63.7h21v69.5h-3.8-17.2v-69.5zm99.9-257.7h-32.3v-69.5h32.3v69.5zm-32.2 11.4c1.2 0.1 4 0.4 6.3 2.1s2.9 3.9 3 4.7h-9.3v-6.8zm0-7.3h9.3c-0.1 0.8-0.7 3-3 4.7-2.3 1.6-5.1 2-6.3 2.1v-6.8zm0 14.6h9.9v-0.3c0-0.1-0.2-3.1-3.2-5.3-1.6-1.1-3.4-1.7-4.8-1.9 1.4-0.3 3.2-0.8 4.8-1.9 3.1-2.2 3.2-5.2 3.2-5.3v-0.3h-9.9v-1.7h32.3v18.4h-32.3v-1.7zm0 3.6h32.3v33.1h-32.3v-33.1zm0 35.1h32.3v27.5h-32.3v-27.5zm0 29.5h32.3v43.1h-32.3v-43.1zm0 45.1h32.3v31.1h-23.3-9v-31.1zm13.2 52.7v-7.3c0.8 0.1 3 0.5 4.7 2.5 1.4 1.6 1.8 3.6 2 4.7h-6.7zm7.2 0c-0.2-1.2-0.6-3.3-2.1-5.1-2.2-2.6-5.2-2.7-5.3-2.7h-0.3v7.8h-1.8v-19.6h21.2v19.6h-11.7zm-203.8-667.1h40.5v41.7h-40.5v-41.7zm42.5 0h28.8v41.7h-28.8v-41.7zm30.7 0h28.8v41.7h-28.8v-41.7zm30.8 0h28.3v41.7h-28.3v-41.7zm30.4 0h28.8v41.7h-28.8v-41.7zm30.7 0h50.5v41.7h-50.5v-41.7zm58.3 593c2 1.7 2.4 3.9 2.5 4.7h-6.3v-6.5c1.1 0.3 2.5 0.8 3.8 1.8zm0-97.1c2 1.7 2.4 3.9 2.5 4.7h-6.3v-6.5c1.1 0.3 2.5 0.8 3.8 1.8zm2.5-9.4c-0.1 0.8-0.5 3-2.5 4.7-1.2 1-2.6 1.5-3.7 1.8v-6.5h6.2zm0-324.8c-0.1 0.8-0.5 3-2.5 4.7-1.2 1-2.6 1.5-3.7 1.8v-6.5h6.2zm-235.4 332.1c-2-1.7-2.4-3.9-2.5-4.7h8v6.8c-0.9-0.1-3.5-0.4-5.5-2.1zm1.7 491.6c-2-1.7-2.4-3.9-2.5-4.7h6.3v6.5c-1.2-0.3-2.6-0.8-3.8-1.8zm232.5-326.7c-1.8 1.5-4 1.9-5.1 2v-6.7h7.6c-0.1 0.8-0.5 3-2.5 4.7z",
        style: "fill:#9eddf9"
      }, nil},
      {:path, %{
        style: "fill:#9eddf9",
        d: "m90.4 476h19.7v12.4h18.2v-14.1h40.3v10.7h2v-10.7-1-56.4h8.3v-2h-8.3-42.3-2-54-1v73.5h19.1v-12.4zm78.2-59.2v55.4h-40.3v-55.4h40.3zm-42.3 57.5v12.1h-14.3v-12.4h-10.2v-57.2h24.5v57.5zm-37.9 12.1h-15.1v-69.5h26.6v57.2h-11.5v12.3z"
      }, nil},
      {:rect, %{
        style: "fill:#9eddf9",
        height: "2", style: "fill:#9eddf9", width: "98.7", x: "70.9", y: "500.2"
      }, nil},
      {:path, %{d: "m93.4 873.9h-20.4v55.5l10.6 16.6h9.7 2 17v-9.5h20.5v9.5h18.6v-72.1h-56-2zm0 2v32.2h-18.4v-32.2h18.4zm-8.7 68.1-9.7-15.2v-18.7h18.4v33.9h-8.7zm25.6-9.5v9.5h-14.9v-51.6h26v42.1h-11.1zm24.5 9.5v-9.5h-11.4v-42.1h26v51.6h-14.6zm14.6-53.6h-26v-14.5h26v14.5zm-28-14.5v14.5h-26v-14.5h26z",
        style: "fill:#9eddf9"
      }, nil}

        ]}
      end

      def south_building do
      {:g, %{ id: "south-bldg", transform: "rotate(202.6 412.32 410.5)"}, [
        {:path, %{
          d: "m630.93 462.83v-171.2h-53v18.92l-25.75-0.35v-18.57h-52.8v35.6h-0.61v2.27h0.61v40.15h37.62v90.9h-37.64v50.75h39.92v-48.47zm-34.46-133.32h32.19v37.87h-32.19zm32.19-2.27h-32.19v-33.33h32.19zm-48.48-14.38v-19h14v73.48h-27.9v-54.67zm-78.55-19h32.37v33.33h-32.37zm0 35.6h32.37v37.87h-32.37zm34.62 37.87v-73.42h13.63v18.54l14.13 0.19v54.74h-27.76zm92.41 2.27v44.4h-89.38v-44.34zm-89.38 46.59h89.38v44.31h-89.38zm-2.28 92.81h-35.37v-46.17h35.37z",
          style: "fill:#9eddf9"
        }, nil},
      {:path, %{
        d: "m397.85 643.88-38.67 17 54.53 123.86 0.46 1 38.67-17-54.53-123.82zm-1.16 3 16.23 36.87-34.67 14.83-16.07-36.51zm-1.26 90.72-16.26-36.94 34.67-14.83 16.27 36.94zm35.57-12.765.56 12.62-34.66 14.83-5.56-12.62zm-15.68 58-12.52-28.43 34.67-14.83 12.36 28.07z",
        style: "fill:#9eddf9"
      }, nil},
      {:path, %{
        d: "m369.63 735.81-4.74-10.14 7.41-3.18-26-59-46.47 20.51 40.23 91.38 46.52-20.48-9.85-22.38zm-7.79-11.3 2.74 5.86-35.23 15.07-10.65-24.18 42.56-18.21 8 18.25zm-16.66-58 15.17 34.49-42.56 18.21-15-34zm-4 105.87-11-24.88 35.27-15.09 3 6.39 7-3.26 8 18.19z",
        style: "fill:#9eddf9"
      }, nil},
      {:path, %{
        d: "m715.07 643.39h9.48l-0.08-0.64a12 12 0 0 0 -4 -7.37 13.63 13.63 0 0 0 -5.41 -2.7v-12.29h-27v-156.8h7.78l-0.08-0.64a11.83 11.83 0 0 0 -4 -7.37 12.92 12.92 0 0 0 -3.7 -2.15v-170.88h7.78l-0.08-0.64a11.83 11.83 0 0 0 -4 -7.37 12.91 12.91 0 0 0 -3.7 -2.15v-171.45h7.78l-0.08-0.64a11.83 11.83 0 0 0 -4 -7.37 12.91 12.91 0 0 0 -3.7 -2.15v-90.78h-245.37v4.54h1.31l-0.49 86h-8.71l0.08 0.64a11.83 11.83 0 0 0 4 7.37 13.25 13.25 0 0 0 4.57 2.46l-1 170.38h-7.68l0.08 0.64a11.82 11.82 0 0 0 4 7.37 12.84 12.84 0 0 0 3.54 2.08l-1 171.06a12.45 12.45 0 0 0 -2.66 1.72 11.82 11.82 0 0 0 -4 7.37l-0.08 0.64h6.68l-0.54 94.59a12.19 12.19 0 0 0 -1.69 1.17 11.83 11.83 0 0 0 -4 7.37l-0.08 0.64h5.71v2.46l-43.1 17.81-4.12-8-0.53 0.37a11.79 11.79 0 0 0 -4.72 6.92 13 13 0 0 0 -0.19 4.66l-127 52.48-2.72-6.74-0.56 0.32a11.79 11.79 0 0 0 -5.29 6.5 12.67 12.67 0 0 0 -0.58 3.66l-249.82 103.23-2.1 0.87 94.16 226.91 81.17-33.84 3.7 8.61 0.58-0.43a13.79 13.79 0 0 0 4.25 -4.91 11.69 11.69 0 0 0 1 -7.25l1.51-0.63a11.69 11.69 0 0 0 6 4.39 12.61 12.61 0 0 0 3.77 0.55 16.07 16.07 0 0 0 2.71 -0.24l0.71-0.12-3.66-8.56 152.6-63.62 3.09 7.2 0.58-0.43a13.77 13.77 0 0 0 4.25 -4.91 11.47 11.47 0 0 0 1.17 -5.65l158.38-66 2.86 6.66 0.58-0.43a13.8 13.8 0 0 0 4.25 -4.91 11.46 11.46 0 0 0 1.18 -5l161.89-67.5 1.4-0.58v-75h27zm4.67-7.15a10.77 10.77 0 0 1 3.5 6h-8.16v-8.42a12.32 12.32 0 0 1 4.66 2.43zm-536.87 262.3-8.4-18.59 4.17-1.71h0.06l-50.13-121.88-6.06 2.64-19-46.29 177.69-73.4 14.87 32.92 113.63-49 9.1 20.74-6 2.57 15.25 35.86 73.55-30.65v-107.87h-56.1l1-174.22h39.76v-82.44h-39.26l0.12-20.58h39.17v-14.4h-39.12l1.2-208.68h235.21v243.66h-39.39v378.61h-6.37l-25.71 36.81 5 11zm-176.93-145.54l95.51-39.45 19.84 48.45 6.06-2.65 20.49 49.81-34.65 14.24 27.88 67.85-66.36 27.5zm110.21 71.62 32.51-13.36 16.82 40.93-32.18 14.19zm27 65.7-9-21.87 32.19-14.15 9.3 22.62-14.78 6.12zm303.55-557.02h37.3v34.09h-37.49zm37.3-2.3h-37.28l0.18-31.06h37.1zm0-33.33h-37.09v-8.2h37zm-75.09 318 8-3.85l-0.49-1.09-10.2-23.03 39.12-16.16v-5.5h0.37v-11.04l-0.3 0.07 0.05-8.95h53.87v104.19l-70.07 29.2-13.46-31.71 6-2.58zm-88.78 43.74-13.46-30.57 14.39-6 20.17-8.33 13.24 30.08zm-2.09 0.9-20.76 8.94-13.88-30.73 21.17-8.8zm38.53-16.6-13.23-30.05 29.61-12.23 13 29.61zm31.51-13.57-13-29.58 28.84-11.91 10.05 22.09-8 3.84 2.9 6.61zm59.1-375.65h36.82v9.85h-36.9zm1.43-250h46v36.79h-46.23zm48.27 0h32.81v36.79h-32.84zm35.08 0h67.84v36.79h-67.86zm70.11 0h31.48v36.79h-31.55zm33.75 0h47.78v36.79h-47.8zm-126 794.73-13.84-31.59 28.43-12.11 13.72 31.48 2.08-0.91-13.76-31.4 29.55-12.6 14 32zm-255.45 71.3 13 29.76-35.51 14.81-12.24-29.79zm15.14 28.89-13.05-29.78 62.23-26.5 13.26 30.25zm51.27-57.17 27-11.49 13.35 30.47-27.13 11.34zm29.08-12.39 34.37-14.64 13.43 30.79-34.48 14.4zm107.66-45.85l13.72 31.3-34.72 14.48-13.6-31zm-36.7 15.63 13.59 31-34.61 14.43-13.48-30.76zm52.51 14.79-13.72-31.31 34.26-14.59 13.84 31.57zm159.44-66.42l-28 11.69-14.16-32.3 27.48-11.7zm-44.29-19.72 14.15 32.28-30.44 12.69-14.06-32.05zm95.1-1.47-48.7 20.31-15.49-34.47-0.19 0.08-4.48-9.84 24.28-34.78h44.57zm-37.12-61v-55.65h37.12v55.68zm0-90.9h37.12v33h-37.12zm0-138.62h37.12v33h-37.12zm37.12-138.62h-37.12v-8.2h37.12zm-37.12 2.33h37.12v31h-37.12zm0 33.33h37.12v34.09h-37.12zm0 36.36h37.12v64.31h-37.12zm0 101.88h37.12v33h-37.12zm0 35.22h37.12v30.68h-37.12zm0 33h37.12v33h-37.12zm-428.94 346.47 12.23 29.74-34.48 14.38-11.52-29.77zm470.6-251.76a11.65 11.65 0 0 1 3 1.74 10.8 10.8 0 0 1 3.49 6h-6.46zm3-178.06a10.8 10.8 0 0 1 3.49 6h-6.46v-7.74a11.7 11.7 0 0 1 2.94 1.74zm0-181a10.8 10.8 0 0 1 3.49 6h-6.46v-7.75a11.69 11.69 0 0 1 2.94 1.71zm0-181.61a10.8 10.8 0 0 1 3.49 6h-6.46v-7.83a11.69 11.69 0 0 1 2.94 1.79zm-251.47 3.84a10.8 10.8 0 0 1 -3.49 -6h7.38v8.09a12.07 12.07 0 0 1 -3.89 -2.09zm0 180.85a10.8 10.8 0 0 1 -3.5 -6h6.35v7.69a11.59 11.59 0 0 1 -2.85 -1.69zm-3.6 182.6a10.8 10.8 0 0 1 3.5 -6 11.17 11.17 0 0 1 1.92 -1.28v7.29zm0.38 103.78a10.8 10.8 0 0 1 3.49 -6 11.11 11.11 0 0 1 0.94 -0.63v6.64zm-47 20.95a10.78 10.78 0 0 1 3.74 -5.86l3.47 6.74-7.42 3.06a11.74 11.74 0 0 1 0.22 -3.94zm-135.85 57.35a10.79 10.79 0 0 1 4.22 -5.52l2.25 5.47-7 2.89a11.35 11.35 0 0 1 0.53 -2.84zm-178 277.64 86.86-36 9.93-4.08 8.89 19.67 11.92 30.79-96.57 40.32zm107.26 25.57a12.35 12.35 0 0 1 -3.34 4.06l-3.12-7.27 7.41-3.09a10.71 10.71 0 0 1 -0.95 6.3zm15.16-3.68a12.35 12.35 0 0 1 -5.24 -0.38 10.56 10.56 0 0 1 -5.26 -3.76l7.41-3.09zm157.4-69.93a12.34 12.34 0 0 1 -3.34 4.06l-2.52-5.86 6.92-2.88a10.39 10.39 0 0 1 -1.06 4.68zm167.24-70.36a12.35 12.35 0 0 1 -3.34 4.06l-2.3-5.32 6.67-2.78a10.28 10.28 0 0 1 -1.03 4.04zm191.3-148.73h-25.82v-10.32h7.78l-0.08-0.64a11.83 11.83 0 0 0 -4 -7.37 12.92 12.92 0 0 0 -3.7 -2.15v-11.71h25.82z",
        style: "fill:#9eddf9"
      }, nil}
    ]}
  end

  def desk do
    {:path, %{style: "fill: #485665;",id: "master-desk", d: "m12 0.067938 11.919 6.7526-2.987 5.0985s-5.7475-3.2208-8.9324-3.2446c-3.3107-0.0242-8.9323 3.2446-8.9323 3.2446l-2.9865-5.0985z"}, nil}
  end
end
