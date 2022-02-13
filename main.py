#from dm_control import suite
#from dm_control import viewer
#import numpy as np

#from absl import app
from flask import Flask

# Define a uniform random policy.
#def random_policy(time_step):
#  del time_step  # Unused.
#  return np.random.uniform(low=action_spec.minimum,
#                           high=action_spec.maximum,
#                           size=action_spec.shape)

app = Flask(__name__)


@app.route('/')
def main():
#  env = suite.load(domain_name="humanoid", task_name="stand")
#  action_spec = env.action_spec()
#  viewer.launch(env, policy=random_policy)
  return 'Hello, World!'

#env = suite.load(domain_name="humanoid", task_name="stand")
#action_spec = env.action_spec()





#def main(_):
  # Launch the viewer application.
#  viewer.launch(env, policy=random_policy)


#if __name__ == '__main__':
#  app.run(main)
