#!/usr/bin/env bash



    
set_aura_breathe () {
    echo "Set Separate Zones? (y/n)"
    read sepzones

    if [[ "${sepzones}" == "y" ]]; then
        separate_zones_breathe
    elif [[ "${sepzones}" == "n" ]]; then
        one_zone_breathe
    fi
}

one_zone_breathe() {
    echo "enter the name of the new profile"
    read name 

    echo "Enter the first start_colour code in hexadecimals"
    read col
    r1=${col:0:2}
    g1=${col:2:2}
    b1=${col:4:2}

    echo "Enter the second start_colour code in hexadecimals"
    read col
    r2=${col:0:2}
    g2=${col:2:2}
    b2=${col:4:2}

    echo "Enter the speed
    [0]: Low
    [1]: Medium
    [2]: High
    "
    read col
    if [[ "${col}" == "0" ]]; then
        s="Low"
    elif [[ "${col}" == "1" ]]; then
        s="Medium"
    elif [[ "${col}" == "1" ]]; then
        s="High"
    fi
    create_aura_breathe $name $r1 $g1 $b1 $r2 $b2 $g2 $s
}

create_aura_breathe () {

    touch /home/$USER/.config/rog/$1.ron

    if (( $# == 8 )); then
        echo "
(
    name: \"""$1""\",
    aura: (
        effects: [
            Breathe((
                led: ZonedKbLeft,
                start_colour1: (r: 0x$2, g: 0x$3, b: 0x$4),
                start_colour2: (r: 0x$5, g: 0x$6, b: 0x$7),
                speed: "$8"
            )),
            Breathe((
                led: ZonedKbLeftMid,
                start_colour1: (r: 0x$2, g: 0x$3, b: 0x$4),
                start_colour2: (r: 0x$5, g: 0x$6, b: 0x$7),
                speed: "$8"
            )),
            Breathe((
                led: ZonedKbRightMid,
                start_colour1: (r: 0x$2, g: 0x$3, b: 0x$4),
                start_colour2: (r: 0x$5, g: 0x$6, b: 0x$7),
                speed: "$8"
            )),
            Breathe((
                led: ZonedKbRight,
                start_colour1: (r: 0x$2, g: 0x$3, b: 0x$4),
                start_colour2: (r: 0x$5, g: 0x$6, b: 0x$7),
                speed: "$8"
            )),
            Breathe((
                led: LightbarRight,
                start_colour1: (r: 0x$2, g: 0x$3, b: 0x$4),
                start_colour2: (r: 0x$5, g: 0x$6, b: 0x$7),
                speed: "$8"
            )),
            Breathe((
                led: LightbarRightCorner,
                start_colour1: (r: 0x$2, g: 0x$3, b: 0x$4),
                start_colour2: (r: 0x$5, g: 0x$6, b: 0x$7),
                speed: "$8"
            )),
            Breathe((
                led: LightbarRightBottom,
                start_colour1: (r: 0x$2, g: 0x$3, b: 0x$4),
                start_colour2: (r: 0x$5, g: 0x$6, b: 0x$7),
                speed: "$8"
            )),
            Breathe((
                led: LightbarLeftBottom,
                start_colour1: (r: 0x$2, g: 0x$3, b: 0x$4),
                start_colour2: (r: 0x$5, g: 0x$6, b: 0x$7),
                speed: "$8"
            )),
            Breathe((
                led: LightbarLeftCorner,
                start_colour1: (r: 0x$2, g: 0x$3, b: 0x$4),
                start_colour2: (r: 0x$5, g: 0x$6, b: 0x$7),
                speed: "$8"
            )),
            Breathe((
                led: LightbarLeft,
                start_colour1: (r: 0x$2, g: 0x$3, b: 0x$4),
                start_colour2: (r: 0x$5, g: 0x$6, b: 0x$7),
                speed: "$8"
            )),
        ],
        zoned: true,
    ),
)
    " > /home/$USER/.config/rog/$1.ron
    fi

    update_rog_user "$1"    
}

set_aura_static() {  
    echo "Set Separate Zones? (y/n)"
    read sepzones

    if [[ "${sepzones}" == "y" ]]; then
        separate_zones_static
    elif [[ "${sepzones}" == "n" ]]; then
        one_zone_static
    fi
}

separate_zones_static () {
    echo "enter the name of the new profile"
    read name 

    echo "Enter the colour code in hexadecimals"

    echo "ZoneKbdLeft"
    read col
    r1=${col:0:2}
    g1=${col:2:2}
    b1=${col:4:2}
    echo "ZoneKbdLeftMid"
    read col
    r2=${col:0:2}
    g2=${col:2:2}
    b2=${col:4:2}
    echo "ZoneKbdRightMid"
    read col
    r3=${col:0:2}
    g3=${col:2:2}
    b3=${col:4:2}
    echo "ZoneKbdRight"
    read col
    r4=${col:0:2}
    g4=${col:2:2}
    b4=${col:4:2}
    echo "LightbarRight"
    read col
    r5=${col:0:2}
    g5=${col:2:2}
    b5=${col:4:2}
    echo "LightbarRightCorner"
    read col
    r6=${col:0:2}
    g6=${col:2:2}
    b6=${col:4:2}
    echo "LightbarRightBottom"
    read col
    r7=${col:0:2}
    g7=${col:2:2}
    b7=${col:4:2}
    echo "LightbarLeftBottom"
    read col
    r8=${col:0:2}
    g8=${col:2:2}
    b8=${col:4:2}
    echo "LightbarLeftCorner"
    read col
    r9=${col:0:2}
    g9=${col:2:2}
    b9=${col:4:2}
    echo "LightbarLeft"
    read col
    r10=${col:0:2}
    g10=${col:2:2}
    b10=${col:4:2}

    create_aura_static $name $r1 $b1 $g1 $r2 $b2 $g2 $r3 $b3 $g3 $r4 $b4 $g4 $r5 $b5 $g5 $r6 $b6 $g6 $r7 $b7 $g7 $r8 $b8 $g8 $r9 $b9 $g9 $r10 $b10 $g10    
}

one_zone_static () {

    echo "enter the name of the new profile"
    read name 

    echo "Enter the colour code in hexadecimals"
    read col
    r=${col:0:2}
    g=${col:2:2}
    b=${col:4:2}

    create_aura_static $name $r $g $b
}

create_aura_static () {

    touch /home/$USER/.config/rog/$1.ron

    if (( $# == 4 )); then
        echo "
(
    name: \"""$1""\",
    aura: (
        effects: [
            Static((
                led: ZonedKbLeft,
                colour: (r: 0x$2, g: 0x$3, b: 0x$4),
            )),
            Static((
                led: ZonedKbLeftMid,
                colour: (r: 0x$2, g: 0x$3, b: 0x$4),
            )),
            Static((
                led: ZonedKbRightMid,
                colour: (r: 0x$2, g: 0x$3, b: 0x$4),
            )),
            Static((
                led: ZonedKbRight,
                colour: (r: 0x$2, g: 0x$3, b: 0x$4),
            )),
            Static((
                led: LightbarRight,
                colour: (r: 0x$2, g: 0x$3, b: 0x$4),
            )),
            Static((
                led: LightbarRightCorner,
                colour: (r: 0x$2, g: 0x$3, b: 0x$4),
            )),
            Static((
                led: LightbarRightBottom,
                colour: (r: 0x$2, g: 0x$3, b: 0x$4),
            )),
            Static((
                led: LightbarLeftBottom,
                colour: (r: 0x$2, g: 0x$3, b: 0x$4),
            )),
            Static((
                led: LightbarLeftCorner,
                colour: (r: 0x$2, g: 0x$3, b: 0x$4),
            )),
            Static((
                led: LightbarLeft,
                colour: (r: 0x$2, g: 0x$3, b: 0x$4),
            )),
        ],
        zoned: true,
    ),
)
    " > /home/$USER/.config/rog/$1.ron
    else
    echo "
(
    name: \"""$1""\",
    aura: (
        effects: [
            Static((
                led: ZonedKbLeft,
                colour: (r: 0x$2, g: 0x$3, b: 0x$4),
            )),
            Static((
                led: ZonedKbLeftMid,
                colour: (r: 0x$5, g: 0x$6, b: 0x$7),
            )),
            Static((
                led: ZonedKbRightMid,
                colour: (r: 0x$8, g: 0x$9, b: 0x${10}),
            )),
            Static((
                led: ZonedKbRight,
                colour: (r: 0x${11}, g: 0x${12}, b: 0x${13}),
            )),
            Static((
                led: LightbarRight,
                colour: (r: 0x${14}, g: 0x${15}, b: 0x${16}),
            )),
            Static((
                led: LightbarRightCorner,
                colour: (r: 0x${17}, g: 0x${18}, b: 0x${19}),
            )),
            Static((
                led: LightbarRightBottom,
                colour: (r: 0x${20}, g: 0x${21}, b: 0x${22}),
            )),
            Static((
                led: LightbarLeftBottom,
                colour: (r: 0x${23}, g: 0x${24}, b: 0x${25}),
            )),
            Static((
                led: LightbarLeftCorner,
                colour: (r: 0x${26}, g: 0x${27}, b: 0x${28}),
            )),
            Static((
                led: LightbarLeft,
                colour: (r: 0x${29}, g: 0x${30}, b: 0x${31}),
            )),
        ],
        zoned: true,
    ),
)
    " > /home/$USER/.config/rog/$1.ron
    fi

    update_rog_user "$1"
}

update_rog_user() {
    echo "
    (
    active_anime: Some(\"anime-default\"),
    active_aura: Some(\"""$1""\"),
    )
    " > /home/"$USER"/.config/rog/rog-user.ron
}

decide () {
    echo "
    Welcome to RGB Control
    Choose what you want to do: 
    [c]: Create a new aura profile
    [s]: Set lighting to an existing profile
    [a]: Start asusd-user daemon
    [ ]: Press any other key to exit
    "
    read char

    if [[ "${char}" == "c" ]]; then
        # sel_basic_mode
        set_aura_static
    elif [[ "${char}" == "s" ]]; then
        set_profile
    elif [[ "${char}" == "a" ]]; then
        asusd-user | kill -2 "$(pgrep asusd-user)"
    fi
}

set_profile () {
    echo "Enter the name of the profile file
    eg: aura-default.ron
    "
    read name
    test -f /home/"$USER"/.config/rog/"$name"
    if (( $? == 0 )); then
        update_rog_user "${name:0:-4}" 
    else
        echo "The file does not exist"
    fi   
}

sel_basic_mode () {
    echo "Choose mode
    [s]: Static
    [b]: Breathe
    "
    read mode
    if [[ "${mode}" == "b" ]]; then
        set_aura_breathe
    elif [[ "${mode}" == "s" ]]; then
        set_aura_static
    fi
    
}

rgbctl () {
    decide 
    asusd-user | kill -2 "$(pgrep asusd-user)"
}

rgbctl
