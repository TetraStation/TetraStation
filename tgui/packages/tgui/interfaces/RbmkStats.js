import { map, sortBy } from 'common/collections';
import { flow } from 'common/fp';
import { toFixed } from 'common/math';
import { pureComponentHooks } from 'common/react';
import { Component, Fragment } from 'inferno';
import { Box, Button, Chart, ColorBox, Flex, Icon, LabeledList, ProgressBar, Section, Table } from '../components';
import { Window } from '../layouts';
import { useBackend, useLocalState } from '../backend';


export const RbmkStats = () => {
  return (
    <Window width={450} height={580} theme="ntos" title="Reactor Monitor">
      <Window.Content>
        <RbmkStatsContent />
      </Window.Content>
    </Window>
  );
};

export const RbmkStatsContent = (props, context) => {
  const { act, data } = useBackend(context);
  const powerData = data.powerData.map((value, i) => [i, value]);
  const pressureData = data.pressureData.map((value, i) => [i, value]);
  const tempInputData = data.tempInputData.map((value, i) => [i, value]);
  const tempOutputdata = data.tempOutputdata.map((value, i) => [i, value]);
  const {
    pressureMax, temperatureMax,
  } = data;

  return (
    <Section>
      <Section title="Reactor Metrics">
        <LabeledList>

          <LabeledList.Item label="Reactor Power">
            <ProgressBar
              value={data.power}
              minValue={0}
              maxValue={120}
              ranges={{
                good: [30, 70],
                average: [0, 30],
                bad: [70, Infinity],
              }}>
              {toFixed(data.power) + ' (%)'}
            </ProgressBar>
          </LabeledList.Item>

          <LabeledList.Item label="Reactor Pressure">
            <ProgressBar
              value={data.reactorPressure}
              minValue={0}
              maxValue={pressureMax}
              ranges={{
                good: [0, 5000],
                average: [5000, 10000],
                bad: [10000, Infinity],
              }}>
              {toFixed(data.reactorPressure) + ' (kPa)'}
            </ProgressBar>
          </LabeledList.Item>

          <LabeledList.Item label="Coolant Temperature">
            <ProgressBar
              value={data.coolantInput}
              minValue={0}
              maxValue={temperatureMax}
              ranges={{
                good: [0, 273],
                average: [273, 373],
                bad: [373, Infinity],
              }}>
              {toFixed(data.coolantInput) + ' (K)'}
            </ProgressBar>
          </LabeledList.Item>

          <LabeledList.Item label="Outlet Temperature">
            <ProgressBar
              value={data.coolantOutput}
              minValue={0}
              maxValue={temperatureMax}
              ranges={{
                good: [573, 1073],
                average: [0, 573],
                bad: [1073, Infinity],
              }}>
              {toFixed(data.coolantOutput) + ' (K)'}
            </ProgressBar>
          </LabeledList.Item>

        </LabeledList>
      </Section>

      <Section title="Power Statistics:" height="100px" />

      <Section title="Pressure Statistics:" height="100px">
        <Chart.Line
          height="60px"
          data={pressureData}
          rangeX={[0, pressureData.length - 1]}
          rangeY={[0, pressureMax]}
          strokeColor="rgba(255,250,250, 1)"
          fillColor="rgba(255,250,250, 0.1)" />
      </Section>

      <Section title="Temperature Statistics:" height="200px">
        <Chart.Line
          height="60px"
          data={tempInputData}
          rangeX={[0, tempInputData.length - 1]}
          rangeY={[-273.15, temperatureMax]}
          strokeColor="rgba(127, 179, 255 , 1)"
          fillColor="rgba(127, 179, 255 , 0.1)" />
        <Chart.Line
          fillPositionedParent
          data={tempOutputdata}
          rangeX={[0, tempOutputdata.length - 1]}
          rangeY={[0, temperatureMax]}
          strokeColor="rgba(255, 0, 0 , 1)"
          fillColor="rgba(255, 0, 0 , 0.1)" />
      </Section>
    </Section>
  );
};
