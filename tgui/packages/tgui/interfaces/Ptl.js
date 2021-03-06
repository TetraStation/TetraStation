import { useBackend } from '../backend';
import { Box, Button, Flex, LabeledList, ProgressBar, Section, Slider } from '../components';
import { formatPower } from '../format';
import { Window } from '../layouts';

// Common power multiplier
const POWER_MUL = 1e3;

export const Ptl = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    capacity,
    chargePercent,
    charge,
    chargeEnabled,
    charging,
    inputLevel,
    inputLevel_text,
    inputLevelMax,
    inputAvailable,
    kwTransmitted,
    transmitEnabled,
    transmitting,
    outputLevel,
    outputLevel_text,
    outputLevelMax,
  } = data;
  const inputState = (
    chargePercent >= 100 && 'good'
    || charging && 'average'
    || 'bad'
  );
  const outputState = (
    transmitting && 'good'
    || charge > 0 && 'average'
    || 'bad'
  );
  return (
    <Window
      width={360}
      height={420}>
      <Window.Content>
        <Section title="Stored Energy">
          <ProgressBar
            value={chargePercent * 0.01}
            ranges={{
              good: [0.5, Infinity],
              average: [0.15, 0.5],
              bad: [-Infinity, 0.15],
            }} />
        </Section>
        <Section title="Input">
          <LabeledList>
            <LabeledList.Item
              label="Charge Mode"
              buttons={
                <Button
                  icon={chargeEnabled ? 'sync-alt' : 'times'}
                  selected={chargeEnabled}
                  onClick={() => act('tryinput')}>
                  {chargeEnabled ? 'Auto' : 'Off'}
                </Button>
              }>
              <Box color={inputState}>
                {chargePercent >= 100 && 'Fully Charged'
                  || charging && 'Charging'
                  || 'Not Charging'}
              </Box>
            </LabeledList.Item>
            <LabeledList.Item label="Target Input">
              <Flex inline width="100%">
                <Flex.Item>
                  <Button
                    icon="fast-backward"
                    disabled={inputLevel === 0}
                    onClick={() => act('input', {
                      target: 'min',
                    })} />
                  <Button
                    icon="backward"
                    disabled={inputLevel === 0}
                    onClick={() => act('input', {
                      adjust: -10000,
                    })} />
                </Flex.Item>
                <Flex.Item grow={1} mx={1}>
                  <Slider
                    value={inputLevel / POWER_MUL}
                    fillValue={inputAvailable / POWER_MUL}
                    minValue={0}
                    maxValue={inputLevelMax / POWER_MUL}
                    step={5}
                    stepPixelSize={4}
                    format={value => formatPower(value * POWER_MUL, 1)}
                    onDrag={(e, value) => act('input', {
                      target: value * POWER_MUL,
                    })} />
                </Flex.Item>
                <Flex.Item>
                  <Button
                    icon="forward"
                    disabled={inputLevel === inputLevelMax}
                    onClick={() => act('input', {
                      adjust: 10000,
                    })} />
                  <Button
                    icon="fast-forward"
                    disabled={inputLevel === inputLevelMax}
                    onClick={() => act('input', {
                      target: 'max',
                    })} />
                </Flex.Item>
              </Flex>
            </LabeledList.Item>
            <LabeledList.Item label="Available">
              {formatPower(inputAvailable)}
            </LabeledList.Item>
          </LabeledList>
        </Section>
        <Section title="Output">
          <LabeledList>
            <LabeledList.Item
              label="Output Mode"
              buttons={
                <Button
                  icon={transmitEnabled ? 'power-off' : 'times'}
                  selected={transmitEnabled}
                  onClick={() => act('tryoutput')}>
                  {transmitting ? 'On' : 'Off'}
                </Button>
              }>
              <Box color={outputState}>
                {transmitting
                  ? 'Transmitting'
                  : charge > 0
                    ? 'Not Transmitting'
                    : 'No Charge'}
              </Box>
            </LabeledList.Item>
            <LabeledList.Item label="Target Output">
              <Flex inline width="100%">
                <Flex.Item>
                  <Button
                    icon="fast-backward"
                    disabled={outputLevel === 0}
                    onClick={() => act('output', {
                      target: 'min',
                    })} />
                  <Button
                    icon="backward"
                    disabled={outputLevel === 0}
                    onClick={() => act('output', {
                      adjust: -10000,
                    })} />
                </Flex.Item>
                <Flex.Item grow={1} mx={1}>
                  <Slider
                    value={outputLevel / POWER_MUL}
                    minValue={0}
                    maxValue={outputLevelMax / POWER_MUL}
                    step={5}
                    stepPixelSize={4}
                    format={value => formatPower(value * POWER_MUL, 1)}
                    onDrag={(e, value) => act('output', {
                      target: value * POWER_MUL,
                    })} />
                </Flex.Item>
                <Flex.Item>
                  <Button
                    icon="forward"
                    disabled={outputLevel === outputLevelMax}
                    onClick={() => act('output', {
                      adjust: 10000,
                    })} />
                  <Button
                    icon="fast-forward"
                    disabled={outputLevel === outputLevelMax}
                    onClick={() => act('output', {
                      target: 'max',
                    })} />
                </Flex.Item>
              </Flex>
            </LabeledList.Item>
            <LabeledList.Item label="Outputting">
              {formatPower(outputLevel)}
            </LabeledList.Item>
            <LabeledList.Item label="Power Transmitted">
              {formatPower(kwTransmitted)}
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
