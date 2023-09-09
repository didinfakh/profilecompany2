import Navbar from '@/component/Navbar';
import Page1 from '@/component/pages/page1';
import Page2 from '@/component/pages/page2';
import Page3 from '@/component/pages/page3';
import MiniPage1 from '@/component/pages/miniPage1';
import Page4 from '@/component/pages/page4';
import MiniPage2 from '@/component/pages/miniPage2';
import Page5 from '@/component/pages/page5';
import Page6 from '@/component/pages/page6';

export default function Home() {
  return (
    <div className="container-fluid p-0">
      <Navbar />
      <Page1 />
      <Page2 />
      <Page3 />
      <MiniPage1 />
      <Page4 />
      <MiniPage2 />
      <Page5 />
      <Page6 />
    </div>
  );
}
