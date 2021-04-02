export const newUser = (user) => (
  $.ajax({
    method: 'POST',
    url: '/api/session',
    data: {
      user: {
      user
      }
    }
  })
)

export const loginUser = (user) => (
  $.ajax({
    method: 'POST',
    url: '/api/session',
    data: {
      user //user: user  {username password}
    }
  })
)

export const logoutUser = () => (
  $.ajax({
    method: 'DELETE',
    url: '/api/session'
  })
)