import { useEffect, useState } from 'react'
import {
  FaArrowRight,
  FaBars,
  FaCode,
  FaDatabase,
  FaGithub,
  FaGlobe,
  FaLinkedinIn,
  FaMobileAlt,
  FaTimes,
  FaWhatsapp,
} from 'react-icons/fa'
import { HiMiniSparkles } from 'react-icons/hi2'
import {
  SiCss,
  SiDart,
  SiFirebase,
  SiFlutter,
  SiJavascript,
  SiReact,
} from 'react-icons/si'
import profileImage from './assets/mohammadNatour.jpeg'
import zenixLogo from './assets/zenixjo.png'
import './App.css'

const projects = [
  {
    title: 'Education App',
    description: {
      en: 'A React Native mobile application focused on educational content delivery, structured learning flows, and an intuitive user experience that keeps the interface clear and accessible.',
      ar: 'تطبيق موبايل مبني باستخدام React Native يركز على تقديم المحتوى التعليمي وتنظيم مسار التعلم مع واجهة واضحة وسهلة الاستخدام.',
    },
    technologies: ['React Native', 'JavaScript'],
    github: 'https://github.com/natour101/Education',
    type: {
      en: 'Mobile App',
      ar: 'تطبيق موبايل',
    },
  },
  {
    title: 'Personal Portfolio Website',
    description: {
      en: 'A modern and responsive personal portfolio website presenting professional identity, technical strengths, and selected work through a polished dark interface.',
      ar: 'موقع شخصي حديث ومتجاوب يعرض الهوية المهنية والمهارات التقنية والمشاريع المختارة من خلال واجهة داكنة احترافية.',
    },
    technologies: ['React', 'JavaScript', 'CSS'],
    github: 'https://github.com/natour101/Portfolio',
    type: {
      en: 'Web Experience',
      ar: 'تجربة ويب',
    },
  },
  {
    title: 'Blood Bank App',
    description: {
      en: 'A Flutter application that helps connect blood donors with people in need, simplifying the donation process and improving accessibility through a practical mobile workflow.',
      ar: 'تطبيق Flutter يساعد على ربط المتبرعين بالدم مع المحتاجين، ويبسّط عملية التبرع ويزيد سهولة الوصول من خلال تجربة عملية على الموبايل.',
    },
    technologies: ['Flutter', 'Dart', 'Firebase'],
    github: 'https://github.com/AdhamAlterawi/bloodBank',
    type: {
      en: 'Community App',
      ar: 'تطبيق مجتمعي',
    },
  },
]

const contactLinks = [
  {
    key: 'whatsapp',
    value: '+962 79 542 2974',
    href: 'https://wa.me/962795422974',
    icon: FaWhatsapp,
  },
  {
    key: 'github',
    value: 'github.com/natour101',
    href: 'https://github.com/natour101',
    icon: FaGithub,
  },
  {
    key: 'linkedin',
    value: 'linkedin.com/in/mohammad-natour-a4315a357',
    href: 'https://www.linkedin.com/in/mohammad-natour-a4315a357/',
    icon: FaLinkedinIn,
  },
]

const skillsData = [
  {
    key: 'mobileDevelopment',
    skills: [
      { name: 'Flutter', level: 94 },
      { name: 'Dart', level: 90 },
      { name: 'React Native', level: 88 },
    ],
  },
  {
    key: 'developmentStack',
    skills: [
      { name: 'JavaScript', level: 86 },
      { name: 'Firebase', level: 85 },
      { name: 'Firestore', level: 84 },
    ],
  },
  {
    key: 'engineeringTools',
    skills: [
      { name: 'Java', level: 82 },
      { name: 'Git', level: 87 },
      { name: 'UI/UX Basics', level: 80 },
    ],
  },
]

const heroStats = [
  { key: 'graduate', value: 'Yarmouk' },
  { key: 'team', value: 'Zenixjo' },
  { key: 'focus', value: 'Mobile' },
]

const content = {
  en: {
    dir: 'ltr',
    brandSubtitle: 'Developer Portfolio',
    nav: [
      { label: 'Home', href: '#home' },
      { label: 'About', href: '#about' },
      { label: 'Skills', href: '#skills' },
      { label: 'Projects', href: '#projects' },
      { label: 'Contact', href: '#contact' },
    ],
    languageButton: 'AR',
    languageLabel: 'العربية',
    hero: {
      eyebrow: 'Developer at Zenixjo Team',
      title: 'Computer Engineer | Flutter Developer | React Native Developer',
      description:
        'Computer Engineering graduate from Yarmouk University, focused on building modern digital products with strong UI quality, smooth experiences, and practical engineering decisions.',
      primaryAction: 'View Projects',
      secondaryAction: 'Contact Me',
      focusLabel: 'Current Focus',
      focusText: 'Mobile apps and polished product interfaces',
      stackLabel: 'Stack',
      stackText: 'Flutter, React Native, Firebase, JavaScript',
      stats: {
        graduate: 'University Graduate',
        team: 'Team Developer',
        focus: 'Flutter & React Native',
      },
    },
    about: {
      badge: 'About Me',
      title:
        'A developer identity built around clean execution, modern interfaces, and practical product thinking.',
      description:
        'I build digital experiences that look professional, feel smooth, and solve real needs with modern mobile and front-end technologies.',
      summaryTitle: 'Professional Summary',
      summary:
        'I am Mohammad Natour, a Computer Engineer and Yarmouk University graduate with a strong interest in mobile application development. I specialize in Flutter and React Native, and I enjoy building modern digital solutions that balance visual quality, usability, and technical clarity. As a developer at Zenixjo Team, I work with a mindset centered on clean product experiences and meaningful results.',
      highlights: [
        'Computer Engineering graduate from Yarmouk University',
        'Mobile app developer focused on Flutter and React Native',
        'Passionate about building modern digital solutions',
        'Developer and team member at Zenixjo',
      ],
      teamBadge: 'Team Affiliation',
      teamTitle: 'Zenixjo Team',
      teamText:
        'Zenixjo represents a professional environment where technology, execution, and modern product thinking come together. This portfolio highlights that spirit through a bold and polished presentation.',
    },
    skills: {
      badge: 'Skills',
      title:
        'A focused stack for building mobile products, polished interfaces, and scalable app experiences.',
      description:
        'The following skills represent the technologies and foundations I rely on to design, develop, and improve professional software products.',
      groups: {
        mobileDevelopment: 'Mobile Development',
        developmentStack: 'Development Stack',
        engineeringTools: 'Engineering Tools',
      },
    },
    projects: {
      badge: 'Projects',
      title:
        'Professional projects presented with clear structure, modern visuals, and strong technical focus.',
      description:
        'Each project highlights the product goal, core technologies, and source code access in a clean portfolio layout built to leave a stronger developer impression.',
      github: 'GitHub',
    },
    contact: {
      badge: 'Contact',
      title:
        'Start the conversation directly through WhatsApp or connect through my professional platforms.',
      description:
        'This contact section is wired to generate a WhatsApp message dynamically from the form and open it instantly when the visitor sends it.',
      formTitle: 'Send a Message',
      name: 'Name',
      phone: 'Phone Number',
      message: 'Message',
      namePlaceholder: 'Your full name',
      phonePlaceholder: '+962 7X XXX XXXX',
      messagePlaceholder: 'Tell me about your idea, project, or collaboration.',
      submit: 'Send Message',
      openWhatsapp: 'Open direct WhatsApp chat',
      panelBadge: 'Direct Contact',
      panelTitle: 'Let us build something modern and useful.',
      panelText:
        'I am available for collaboration, freelance work, app ideas, front-end execution, and mobile development opportunities.',
      identityBadge: 'Professional Identity',
      identityTitle: 'Mohammad Natour',
      identityText: 'Computer Engineer, Flutter Developer, and React Native Developer.',
      links: {
        whatsapp: 'WhatsApp',
        github: 'GitHub',
        linkedin: 'LinkedIn',
      },
    },
    footer: {
      text: 'Built with passion and creativity.',
      copyright: '(c) 2026 Mohammad Natour. All rights reserved.',
    },
  },
  ar: {
    dir: 'rtl',
    brandSubtitle: 'الملف الشخصي المهني',
    nav: [
      { label: 'الرئيسية', href: '#home' },
      { label: 'نبذة تعريفية', href: '#about' },
      { label: 'المهارات', href: '#skills' },
      { label: 'المشاريع', href: '#projects' },
      { label: 'التواصل', href: '#contact' },
    ],
    languageButton: 'EN',
    languageLabel: 'English',
    hero: {
      eyebrow: 'مطور لدى فريق Zenixjo',
      title: 'مهندس حاسوب | مطور Flutter | مطور React Native',
      description:
        'خريج هندسة الحاسوب من جامعة اليرموك، أركز على تطوير منتجات رقمية حديثة تجمع بين جودة الواجهات وسلاسة التجربة ودقة التنفيذ.',
      primaryAction: 'عرض المشاريع',
      secondaryAction: 'تواصل معي',
      focusLabel: 'مجال التركيز الحالي',
      focusText: 'تطوير تطبيقات الهواتف الذكية وتصميم واجهات منتجات احترافية',
      stackLabel: 'التقنيات الأساسية',
      stackText: 'Flutter, React Native, Firebase, JavaScript',
      stats: {
        graduate: 'خريج جامعة اليرموك',
        team: 'مطور في فريق تقني',
        focus: 'Flutter وReact Native',
      },
    },
    about: {
      badge: 'نبذة تعريفية',
      title: 'هوية مهنية تقوم على التنفيذ المتقن والواجهات الحديثة والرؤية العملية في بناء المنتجات.',
      description:
        'أطوّر تجارب رقمية احترافية تتسم بالسلاسة وتلبي احتياجات حقيقية بالاعتماد على تقنيات الويب وتطبيقات الهواتف الذكية الحديثة.',
      summaryTitle: 'الملخص المهني',
      summary:
        'أنا محمد ناطور، مهندس حاسوب وخريج جامعة اليرموك، ولدي اهتمام راسخ بتطوير تطبيقات الهواتف الذكية. أتخصص في Flutter وReact Native، وأسعى إلى بناء حلول رقمية حديثة توازن بين الجودة البصرية وسهولة الاستخدام والوضوح التقني. وبصفتي مطورًا في فريق Zenixjo، أعمل بعقلية تركز على جودة المنتج وتحقيق نتائج ملموسة.',
      highlights: [
        'خريج هندسة الحاسوب من جامعة اليرموك',
        'مطور تطبيقات هواتف ذكية متخصص في Flutter وReact Native',
        'شغوف ببناء حلول رقمية حديثة وعملية',
        'أعمل ضمن فريق Zenixjo بصفة مطور',
      ],
      teamBadge: 'الانتماء المهني',
      teamTitle: 'فريق Zenixjo',
      teamText:
        'يمثل فريق Zenixjo بيئة مهنية تتكامل فيها التقنية مع جودة التنفيذ والرؤية الحديثة في تطوير المنتجات. ويعكس هذا الموقع تلك الروح من خلال عرض احترافي ومنظم.',
    },
    skills: {
      badge: 'المهارات',
      title: 'مجموعة مهارات متخصصة لبناء تطبيقات احترافية وواجهات مصقولة وتجارب قابلة للتطوير.',
      description:
        'تمثل المهارات التالية الأدوات والتقنيات الأساسية التي أعتمد عليها في تصميم المنتجات البرمجية الاحترافية وتطويرها وتحسينها.',
      groups: {
        mobileDevelopment: 'تطوير تطبيقات الهواتف الذكية',
        developmentStack: 'التقنيات الأساسية',
        engineeringTools: 'الأدوات الهندسية',
      },
    },
    projects: {
      badge: 'المشاريع',
      title: 'مشاريع احترافية معروضة بأسلوب منظم ولمسة حديثة وتركيز تقني واضح.',
      description:
        'يعرض كل مشروع هدفه الأساسي والتقنيات المستخدمة ورابط الوصول إلى الشيفرة المصدرية ضمن تقديم نظيف يعزز الانطباع المهني.',
      github: 'GitHub',
    },
    contact: {
      badge: 'التواصل',
      title: 'ابدأ التواصل مباشرة عبر واتساب أو من خلال منصاتي المهنية.',
      description:
        'يرتبط هذا القسم مباشرة بواتساب، حيث تُنشأ الرسالة تلقائيًا من بيانات النموذج وتُفتح فور الإرسال.',
      formTitle: 'إرسال رسالة',
      name: 'الاسم',
      phone: 'رقم الهاتف',
      message: 'الرسالة',
      namePlaceholder: 'اسمك الكامل',
      phonePlaceholder: '+962 7X XXX XXXX',
      messagePlaceholder: 'اكتب نبذة عن فكرتك أو مشروعك أو طبيعة التعاون المطلوب.',
      submit: 'إرسال الرسالة',
      openWhatsapp: 'فتح محادثة واتساب مباشرة',
      panelBadge: 'تواصل مباشر',
      panelTitle: 'لنبدأ العمل على مشروع حديث وعملي.',
      panelText:
        'أنا متاح للتعاون المهني، والعمل الحر، وتطوير أفكار التطبيقات، وتنفيذ الواجهات، وفرص تطوير تطبيقات الهواتف الذكية.',
      identityBadge: 'الهوية المهنية',
      identityTitle: 'محمد ناطور',
      identityText: 'مهندس حاسوب، ومطور Flutter، ومطور React Native.',
      links: {
        whatsapp: 'واتساب',
        github: 'GitHub',
        linkedin: 'LinkedIn',
      },
    },
    footer: {
      text: 'صُمم وطُوّر بعناية وشغف.',
      copyright: '© 2026 محمد ناطور. جميع الحقوق محفوظة.',
    },
  },
}

const techIcons = {
  'React Native': FaMobileAlt,
  React: SiReact,
  JavaScript: SiJavascript,
  CSS: SiCss,
  Flutter: SiFlutter,
  Dart: SiDart,
  Firebase: SiFirebase,
  Firestore: FaDatabase,
  Java: FaCode,
  Git: FaGithub,
  'UI/UX Basics': HiMiniSparkles,
}

function SectionHeading({ badge, title, description }) {
  return (
    <div className="section-heading reveal">
      <span className="section-badge">{badge}</span>
      <h2>{title}</h2>
      <p>{description}</p>
    </div>
  )
}

function TechBadge({ tech }) {
  const Icon = techIcons[tech] || FaCode

  return (
    <span className="tech-badge">
      <Icon />
      {tech}
    </span>
  )
}

function App() {
  const [language, setLanguage] = useState('en')
  const [menuOpen, setMenuOpen] = useState(false)
  const [profileImageReady, setProfileImageReady] = useState(true)
  const [logoReady, setLogoReady] = useState(true)
  const [formData, setFormData] = useState({
    name: '',
    phone: '',
    message: '',
  })

  useEffect(() => {
    const items = document.querySelectorAll('.reveal')
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            entry.target.classList.add('is-visible')
            observer.unobserve(entry.target)
          }
        })
      },
      { threshold: 0.15 },
    )

    items.forEach((item) => observer.observe(item))

    return () => observer.disconnect()
  }, [])

  useEffect(() => {
    document.documentElement.lang = language
    document.documentElement.dir = content[language].dir
  }, [language])

  const t = content[language]

  const whatsappMessage = `Hello Mohammad, my name is ${formData.name || '[Name]'}, my phone number is ${formData.phone || '[Phone Number]'}, and my message is: ${formData.message || '[Message]'}`
  const whatsappUrl = `https://wa.me/962795422974?text=${encodeURIComponent(whatsappMessage)}`

  const handleInputChange = ({ target }) => {
    setFormData((current) => ({
      ...current,
      [target.name]: target.value,
    }))
  }

  const handleSubmit = (event) => {
    event.preventDefault()

    if (!formData.name.trim() || !formData.phone.trim() || !formData.message.trim()) {
      return
    }

    window.open(whatsappUrl, '_blank', 'noopener,noreferrer')
  }

  const closeMenu = () => setMenuOpen(false)

  return (
    <div className={`portfolio-page ${language === 'ar' ? 'is-rtl' : ''}`}>
      <div className="bg-orb bg-orb-one" />
      <div className="bg-orb bg-orb-two" />
      <div className="bg-grid" />

      <header className="navbar">
        <a className="brand" href="#home" onClick={closeMenu}>
          <span className="brand-mark brand-photo-mark">
            {profileImageReady ? (
              <img
                className="brand-photo"
                src={profileImage}
                alt="Mohammad Natour"
                onError={() => setProfileImageReady(false)}
              />
            ) : (
              'MN'
            )}
          </span>
          <span className="brand-copy">
            <strong>Mohammad Natour</strong>
            <small>{t.brandSubtitle}</small>
          </span>
        </a>

        <nav className={`nav-menu ${menuOpen ? 'is-open' : ''}`}>
          {t.nav.map((link) => (
            <a key={link.href} href={link.href} onClick={closeMenu}>
              {link.label}
            </a>
          ))}
        </nav>

        <div className="nav-actions">
          <button
            className="language-button"
            type="button"
            onClick={() => setLanguage((current) => (current === 'en' ? 'ar' : 'en'))}
            aria-label={`Switch language to ${t.languageLabel}`}
          >
            <FaGlobe />
            <span>{t.languageButton}</span>
          </button>

        <button
          className="menu-button"
          type="button"
          aria-label="Toggle navigation menu"
          aria-expanded={menuOpen}
          onClick={() => setMenuOpen((current) => !current)}
        >
          {menuOpen ? <FaTimes /> : <FaBars />}
        </button>
        </div>
      </header>

      <main className="page-content">
        <section className="hero-section" id="home">
          <div className="hero-copy reveal">
            <span className="eyebrow">
              <HiMiniSparkles />
              {t.hero.eyebrow}
            </span>
            <h2>{t.hero.title}</h2>
            <p>{t.hero.description}</p>

            <div className="hero-actions">
              <a className="primary-button" href="#projects">
                {t.hero.primaryAction}
                <FaArrowRight />
              </a>
              <a className="secondary-button" href="#contact">
                {t.hero.secondaryAction}
              </a>
            </div>

            <div className="hero-stats">
              {heroStats.map((item) => (
                <article key={item.key} className="glass-card stat-card">
                  <strong>{item.value}</strong>
                  <span>{t.hero.stats[item.key]}</span>
                </article>
              ))}
            </div>
          </div>

          <div className="hero-visual reveal">
            <div className="photo-frame">
              {profileImageReady ? (
                <img
                  className="profile-photo"
                  src={profileImage}
                  alt="Mohammad Natour"
                  onError={() => setProfileImageReady(false)}
                />
              ) : (
                <div className="photo-fallback">MN</div>
              )}
            </div>

            <div className="floating-card floating-card-top glass-card">
              <span>{t.hero.focusLabel}</span>
              <strong>{t.hero.focusText}</strong>
            </div>

            <div className="floating-card floating-card-bottom glass-card">
              <span>{t.hero.stackLabel}</span>
              <strong>{t.hero.stackText}</strong>
            </div>
          </div>
        </section>

        <section className="content-section" id="about">
          <SectionHeading
            badge={t.about.badge}
            title={t.about.title}
            description={t.about.description}
          />

          <div className="about-layout">
            <article className="glass-card about-card reveal">
              <h3>{t.about.summaryTitle}</h3>
              <p>{t.about.summary}</p>

              <ul className="highlight-list">
                {t.about.highlights.map((highlight) => (
                  <li key={highlight}>{highlight}</li>
                ))}
              </ul>
            </article>

            <article className="glass-card company-card reveal">
              <div className="company-header">
                <span className="mini-badge">{t.about.teamBadge}</span>
                <h3>{t.about.teamTitle}</h3>
              </div>

              <div className="company-logo-wrap">
                {logoReady ? (
                  <img
                    className="company-logo"
                    src={zenixLogo}
                    alt="Zenixjo logo"
                    onError={() => setLogoReady(false)}
                  />
                ) : (
                  <div className="logo-fallback">ZX</div>
                )}
              </div>

              <p>{t.about.teamText}</p>
            </article>
          </div>
        </section>

        <section className="content-section" id="skills">
          <SectionHeading
            badge={t.skills.badge}
            title={t.skills.title}
            description={t.skills.description}
          />

          <div className="skills-grid">
            {skillsData.map((group) => (
              <article key={group.key} className="glass-card skill-card reveal">
                <div className="card-head">
                  <h3>{t.skills.groups[group.key]}</h3>
                </div>

                <div className="skill-list">
                  {group.skills.map((skill) => (
                    <div key={skill.name} className="skill-item">
                      <div className="skill-meta">
                        <span>{skill.name}</span>
                        <strong>{skill.level}%</strong>
                      </div>
                      <div className="skill-bar">
                        <div
                          className="skill-progress"
                          style={{ width: `${skill.level}%` }}
                        />
                      </div>
                    </div>
                  ))}
                </div>
              </article>
            ))}
          </div>
        </section>

        <section className="content-section" id="projects">
          <SectionHeading
            badge={t.projects.badge}
            title={t.projects.title}
            description={t.projects.description}
          />

          <div className="projects-grid">
            {projects.map((project, index) => (
              <article key={project.title} className="glass-card project-card reveal">
                <div className="project-card-top">
                  <span className="mini-badge">{project.type[language]}</span>
                  <span className="project-index">0{index + 1}</span>
                </div>

                <div className="project-heading">
                  <h3>{project.title}</h3>
                  <span className="project-line" />
                </div>

                <p>{project.description[language]}</p>

                <div className="tech-list">
                  {project.technologies.map((tech) => (
                    <TechBadge key={tech} tech={tech} />
                  ))}
                </div>

                <div className="project-actions">
                  <a
                    className="primary-button small-button github-button"
                    href={project.github}
                    target="_blank"
                    rel="noreferrer"
                  >
                    {t.projects.github}
                    <FaGithub />
                  </a>
                </div>

                <div className="project-glow" />
              </article>
            ))}
          </div>
        </section>

        <section className="content-section" id="contact">
          <SectionHeading
            badge={t.contact.badge}
            title={t.contact.title}
            description={t.contact.description}
          />

          <div className="contact-layout">
            <form className="glass-card contact-form reveal" onSubmit={handleSubmit}>
              <h3>{t.contact.formTitle}</h3>

              <label>
                {t.contact.name}
                <input
                  type="text"
                  name="name"
                  placeholder={t.contact.namePlaceholder}
                  value={formData.name}
                  onChange={handleInputChange}
                  required
                />
              </label>

              <label>
                {t.contact.phone}
                <input
                  type="tel"
                  name="phone"
                  placeholder={t.contact.phonePlaceholder}
                  value={formData.phone}
                  onChange={handleInputChange}
                  required
                />
              </label>

              <label>
                {t.contact.message}
                <textarea
                  name="message"
                  rows="6"
                  placeholder={t.contact.messagePlaceholder}
                  value={formData.message}
                  onChange={handleInputChange}
                  required
                />
              </label>

              <button className="primary-button submit-button" type="submit">
                {t.contact.submit}
                <FaWhatsapp />
              </button>

              <a
                className="whatsapp-preview"
                href={whatsappUrl}
                target="_blank"
                rel="noreferrer"
              >
                {t.contact.openWhatsapp}
              </a>
            </form>

            <div className="contact-side">
              <article className="glass-card contact-panel reveal">
                <span className="mini-badge">{t.contact.panelBadge}</span>
                <h3>{t.contact.panelTitle}</h3>
                <p>{t.contact.panelText}</p>

                <div className="social-links">
                  {contactLinks.map((item) => {
                    const Icon = item.icon

                    return (
                      <a
                        key={item.label}
                        href={item.href}
                        target="_blank"
                        rel="noreferrer"
                        className="social-card"
                      >
                        <span className="social-icon">
                          <Icon />
                        </span>
                        <span className="social-copy">
                          <small>{t.contact.links[item.key]}</small>
                          <strong>{item.value}</strong>
                        </span>
                      </a>
                    )
                  })}
                </div>
              </article>

              <article className="glass-card availability-card reveal">
                <span className="mini-badge">{t.contact.identityBadge}</span>
                <h3>{t.contact.identityTitle}</h3>
                <p>{t.contact.identityText}</p>
              </article>
            </div>
          </div>
        </section>
      </main>

      <footer className="footer">
        <div className="footer-brand">
          <strong>Mohammad Natour</strong>
          <p>{t.footer.text}</p>
        </div>

        <div className="footer-links">
          {t.nav.map((link) => (
            <a key={link.href} href={link.href}>
              {link.label}
            </a>
          ))}
        </div>

        <p className="footer-copy">{t.footer.copyright}</p>
      </footer>
    </div>
  )
}

export default App
