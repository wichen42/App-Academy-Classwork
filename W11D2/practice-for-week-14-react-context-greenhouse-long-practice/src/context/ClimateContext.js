// Temperature has a default value of 50 degrees
// Humidity has a default value of 40%

import { createContext, useContext, useState, useEffect } from "react";

const ClimateContext = createContext();

export const useClimate = () => useContext(ClimateContext);

export default function ClimateProvider(props) {

    const [temperature, setTemperature] = useState(50);
    const [tempGoal, setTempGoal] = useState(temperature);
    const [humidity, setHumidity] = useState(40);
    const [humidGoal, setHumidGoal] = useState(humidity);


  useEffect(() => {
    let temp2 = temperature;
    let humid2 = humidity;
        const remove = setInterval(() => {
            
            if (tempGoal-temperature > 0 && tempGoal != temp2) setTemperature(prevTemp => {temp2 = prevTemp+1; return temp2})
            if (tempGoal-temperature < 0 && tempGoal != temp2) setTemperature(prevTemp => {temp2 = prevTemp-1; return temp2})
            if (humidGoal-humidity > 0 && ((humidGoal != humid2) && !(humidGoal < humid2))) setHumidity(prevTemp => {humid2 = prevTemp+2; return humid2})
            if (humidGoal-humidity < 0 && (humidGoal != humid2) && !(humidGoal > humid2) ) setHumidity(prevTemp => {humid2 = prevTemp-2; return humid2})
        }, 1000)
        if (temp2 === tempGoal) return () => {clearInterval(remove)};
        if (humid2 === humidGoal) return () => {clearInterval(remove)};

        return () => {clearInterval(remove)};
    }, [tempGoal, humidGoal])

    return (
        <ClimateContext.Provider value={{temperature, setTemperature, humidity, setHumidity, tempGoal, setTempGoal, humidGoal, setHumidGoal}}>
            {props.children}
        </ClimateContext.Provider>
    )
}
