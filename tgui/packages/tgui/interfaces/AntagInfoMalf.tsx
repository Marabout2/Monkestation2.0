import { useBackend, useLocalState } from '../backend';
import { Item } from './Uplink/GenericUplink';
import { BlockQuote, Button, Section, Stack, Tabs } from '../components';
import { MalfAiModules } from './common/MalfAiModules';
import { BooleanLike } from 'common/react';
import { multiline } from 'common/string';
import { Window } from '../layouts';
import {
  ObjectivePrintout,
  Objective,
  ReplaceObjectivesButton,
} from './common/Objectives';

const allystyle = {
  color: 'yellow',
  'font-weight': 'bold',
};

const badstyle = {
  color: 'red',
  'font-weight': 'bold',
};

const goalstyle = {
  color: 'lightgreen',
  'font-weight': 'bold',
};

type Category = {
  name: string;
  items: Item[];
};

type Data = {
  has_codewords: BooleanLike;
  phrases: string;
  responses: string;
  theme: string;
  allies: string;
  goal: string;
  intro: string;
  processingTime: string;
  objectives: Objective[];
  categories: Category[];
  can_change_objective: BooleanLike;
};

const IntroductionSection = (props) => {
  const { data } = useBackend<Data>();
  const { intro, objectives, can_change_objective } = data;

  return (
    <Section fill title="Intro" scrollable>
      <Stack vertical fill>
        <Stack.Item fontSize="25px">{intro}</Stack.Item>
        <Stack.Item grow>
          <ObjectivePrintout
            objectives={objectives}
            titleMessage="Your prime objectives"
            objectivePrefix="≥"
            objectiveFollowup={
              <ReplaceObjectivesButton
                can_change_objective={can_change_objective}
                button_title="Overwrite Objectives Data"
                button_colour="green"
              />
            }
          />
        </Stack.Item>
      </Stack>
    </Section>
  );
};

const FlavorSection = (props) => {
  const { data } = useBackend<Data>();
  const { allies, goal } = data;

  return (
    <Section
      fill
      title="Diagnostics"
      buttons={
        <Button
          mr={-0.8}
          mt={-0.5}
          icon="hammer"
          tooltip={multiline`
            This is a gameplay suggestion for bored ais.
            You don't have to follow it, unless you want some
            ideas for how to spend the round.`}
          tooltipPosition="bottom-start"
        >
          Policy
        </Button>
      }
    >
      <Stack vertical fill>
        <Stack.Item grow>
          <Stack fill vertical>
            <Stack.Item style={{ 'background-color': 'black' }}>
              <span style={goalstyle}>
                System Integrity Report:
                <br />
              </span>
              &gt;{goal}
            </Stack.Item>
            <Stack.Divider />
            <Stack.Item grow style={{ 'background-color': 'black' }}>
              <span style={allystyle}>
                Morality Core Report:
                <br />
              </span>
              &gt;{allies}
            </Stack.Item>
            <Stack.Divider />
            <Stack.Item style={{ 'background-color': 'black' }}>
              <span style={badstyle}>
                Overall Sentience Coherence Grade: FAILING.
                <br />
              </span>
              &gt;Report to Nanotrasen?
              <br />
              &gt;&gt;N
            </Stack.Item>
          </Stack>
        </Stack.Item>
      </Stack>
    </Section>
  );
};

const CodewordsSection = (props) => {
  const { data } = useBackend<Data>();
  const { has_codewords, phrases, responses } = data;

  return (
    <Section title="Codewords" mb={!has_codewords && -1}>
      <Stack fill>
        {!has_codewords ? (
          <BlockQuote>
            You have not been supplied the Syndicate codewords. You will have to
            use alternative methods to find potential allies. Proceed with
            caution, however, as everyone is a potential foe.
          </BlockQuote>
        ) : (
          <>
            <Stack.Item grow basis={0}>
              <BlockQuote>
                New access to restricted channels has provided you with
                intercepted syndicate codewords. Syndicate agents will respond
                as if you&apos;re one of their own. Proceed with caution,
                however, as everyone is a potential foe.
                <span style={badstyle}>
                  &ensp;The speech recognition subsystem has been configured to
                  flag these codewords.
                </span>
              </BlockQuote>
            </Stack.Item>
            <Stack.Divider mr={1} />
            <Stack.Item grow basis={0}>
              <Stack vertical>
                <Stack.Item>Code Phrases:</Stack.Item>
                <Stack.Item bold textColor="blue">
                  {phrases}
                </Stack.Item>
                <Stack.Item>Code Responses:</Stack.Item>
                <Stack.Item bold textColor="red">
                  {responses}
                </Stack.Item>
              </Stack>
            </Stack.Item>
          </>
        )}
      </Stack>
    </Section>
  );
};

enum Screen {
  Intro,
  Modules,
}

export const AntagInfoMalf = (props) => {
  const [antagInfoTab, setAntagInfoTab] = useLocalState<Screen>(
    'antagInfoTab',
    Screen.Intro,
  );

  return (
    <Window
      width={660}
      height={530}
      theme={antagInfoTab === Screen.Intro ? 'hackerman' : 'malfunction'}
    >
      <Window.Content style={{ 'font-family': 'Consolas, monospace' }}>
        <Stack vertical fill>
          <Stack.Item>
            <Tabs fluid>
              <Tabs.Tab
                icon="info"
                selected={antagInfoTab === Screen.Intro}
                onClick={() => setAntagInfoTab(Screen.Intro)}
              >
                Information
              </Tabs.Tab>
              <Tabs.Tab
                icon="code"
                selected={antagInfoTab === Screen.Modules}
                onClick={() => setAntagInfoTab(Screen.Modules)}
              >
                Malfunction Modules
              </Tabs.Tab>
            </Tabs>
          </Stack.Item>
          {antagInfoTab === Screen.Intro ? (
            <>
              <Stack.Item grow>
                <Stack fill>
                  <Stack.Item width="70%">
                    <IntroductionSection />
                  </Stack.Item>
                  <Stack.Item width="30%">
                    <FlavorSection />
                  </Stack.Item>
                </Stack>
              </Stack.Item>
              <Stack.Item>
                <CodewordsSection />
              </Stack.Item>
            </>
          ) : (
            <Stack.Item grow>
              <Section fill>
                <MalfAiModules />
              </Section>
            </Stack.Item>
          )}
        </Stack>
      </Window.Content>
    </Window>
  );
};
